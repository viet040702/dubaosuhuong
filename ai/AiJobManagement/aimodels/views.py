from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
import numpy as np
import pandas as pd
from tensorflow.keras.models import load_model
# from tensorflow.keras.models import load_model

from sklearn.preprocessing import MinMaxScaler
import unicodedata
import os
from statsmodels.tsa.seasonal import seasonal_decompose

# Hàm chuẩn hóa tên để loại bỏ dấu tiếng Việt
def remove_accents(input_str):
    nfkd_form = unicodedata.normalize('NFKD', input_str)
    return ''.join([c for c in nfkd_form if not unicodedata.combining(c)])

# Hàm dự đoán
def predict_next_12_months(job, city, models, data, scaler):
    job_city = f"{job} - {city}".strip()  # Loại bỏ khoảng trắng dư thừa
    job_city_normalized = remove_accents(job_city)  # Chuẩn hóa tên thành phố và công việc

    # In ra các mô hình có sẵn để kiểm tra sự khác biệt giữa tên nhập và tên mô hình
    print("Các mô hình hiện có:")
    for model_name in models.keys():
        print(f"- {model_name}")

    # Kiểm tra nếu job_city tồn tại trong các mô hình
    if job_city_normalized not in models:
        print(f"Không tìm thấy mô hình cho {job_city}. Vui lòng kiểm tra lại.")
        return

    model = models[job_city_normalized]

    # Lọc dữ liệu cho job_city
    job_data = data[data['job_city'] == job_city]
    if job_data.empty:
        print(f"Không tìm thấy dữ liệu cho {job_city}.")
        return

    # Phân tích mùa vụ và xu hướng (Seasonal decomposition)
    seasonal_period = 6  # Giả sử chu kỳ là 12 tháng
    result = seasonal_decompose(job_data["job_postings_count_scaled"], model='additive', period=seasonal_period)

    # Lấy phần xu hướng (trend) và mùa vụ (seasonality)
    job_data["job_postings_trend"] = result.trend.fillna(method="bfill").fillna(method="ffill")
    job_data["job_postings_seasonality"] = result.seasonal.fillna(method="bfill").fillna(method="ffill")

    # Chọn dữ liệu xu hướng để sử dụng
    data_to_use = job_data["job_postings_trend"].values.reshape(-1, 1)

    # In giá trị xu hướng (trend) và mùa vụ (seasonality)
    print("Giá trị xu hướng (trend) trong 12 tháng cuối:")
    print(job_data["job_postings_trend"].tail(12).values)

    print("Giá trị mùa vụ (seasonality) trong 12 tháng cuối:")
    print(job_data["job_postings_seasonality"].tail(12).values)

    # Lấy chuỗi thời gian cuối cùng để dự đoán
    last_sequence = job_data["job_postings_trend"].values[-12:].reshape(1, 12, 1)

    # Tạo ngày tháng cho 12 tháng cuối
    last_dates = pd.to_datetime(job_data["month"].tail(12)).dt.date.values  # Chuyển đổi thành đối tượng datetime

    # In ra thời gian của các giá trị trong last_sequence
    print("Thời gian của các giá trị trong last_sequence:")
    historical = []
    for i, date in enumerate(last_dates):
        print(f"{date.strftime('%Y-%m')}: {last_sequence[0][i][0]}")
        historical.append(scaler.inverse_transform(np.array(last_sequence[0][i][0]).reshape(-1, 1)))

    flattened_array = [item[0][0] for item in historical]

    flattened_array

    # Dự đoán 12 tháng tiếp theo
    predicted_values = []
    for _ in range(12):
        next_value = model.predict(last_sequence)
        predicted_values.append(next_value.flatten()[0])
        last_sequence = np.append(last_sequence[:, 1:, :], next_value.reshape(1, 1, 1), axis=1)

    # Chuyển giá trị về thang đo gốc
    predicted_values_scaled = scaler.inverse_transform(np.array(predicted_values).reshape(-1, 1))

    # Tạo ngày tháng cho 12 tháng tiếp theo
    last_date = pd.to_datetime(job_data.iloc[-1]['month'])
    future_dates = [last_date + pd.DateOffset(months=i + 1) for i in range(12)]

    # In kết quả
    print(f"Dự đoán 12 tháng tiếp theo cho {job_city}:")

    result_predicted = []
    for i in range(12):
        print(f"Tháng {future_dates[i].strftime('%Y-%m')}: {predicted_values_scaled[i][0]:.2f}")
        result_predicted.append(predicted_values_scaled[i][0])

    return {
        "historical": data["job_postings_count"][len(data)-12:],
        "prediction": result_predicted,
        "data_history": data["job_postings_count"][len(data)-12:]
        }


class APIViewAI(APIView): 
    def options(self, request, *args, **kwargs):
        dataRequest = request.data  # Lấy dữ liệu từ body của request
        print(dataRequest)

        # Nhập công việc và thành phố thông qua input box
        job = dataRequest.get('job')
        city = dataRequest.get('city')
        print(job, city)


        # Đọc dữ liệu từ file CSV
        data = pd.read_csv('./aimodels/model/dulieu2.csv')

        # Tạo cột 'job_city' bằng cách gộp 'job' và 'city'
        if 'job' not in data.columns or 'city' not in data.columns:
            raise ValueError("Dữ liệu phải chứa cột 'job' và 'city'.")
        data["job_city"] = data["job"] + " - " + data["city"]

        # Chuẩn hóa cột 'job_postings_count'
        scaler = MinMaxScaler(feature_range=(0, 1))
        data["job_postings_count_scaled"] = scaler.fit_transform(
            data["job_postings_count"].values.reshape(-1, 1)
        )

        # Load các mô hình đã lưu
        models_dir = "./aimodels/model/models4/"
        models = {}

        # In tất cả các tên file mô hình có trong thư mục để kiểm tra
        print("Các mô hình có trong thư mục:")
        for model_file in os.listdir(models_dir):
            print(f"Đang tìm mô hình: {model_file}")  # In ra tên mô hình trong thư mục

            # Chỉ xử lý các file mô hình có hậu tố '_model.keras'
            if model_file.endswith("_model.h5"):
                job_city = model_file.replace("_model.h5", "").strip()  # Loại bỏ phần '_model.keras' và khoảng trắng thừa
                job_city_normalized = remove_accents(job_city)  # Chuẩn hóa tên mô hình
                models[job_city_normalized] = load_model(os.path.join(models_dir, model_file))
        
        print(models)
        # Gọi hàm dự đoán với các giá trị nhập từ người dùng
        value = predict_next_12_months(job, city, models, data, scaler)

        response = Response({"predict_next_12_months": value}, status=status.HTTP_200_OK)
        # Thêm các header tùy chỉnh (CORS nếu cần)
        response["Allow"] = "GET, POST, OPTIONS"
        response["Access-Control-Allow-Origin"] = "*"
        response["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS"
        response["Access-Control-Allow-Headers"] = "Content-Type, Authorization"
        
        return response
    
    def get(self, request, *args, **kwargs):
        data = [
        22.083333333333332,
        22.833333333333332,
        24.0,
        24.416666666666668,
        23.916666666666668,
        22.5,
        22.0,
        21.833333333333332,
        22.166666666666668,
        22.166666666666668,
        22.166666666666668,
        22.166666666666668
    ]
        return Response(data, status=status.HTTP_200_OK)
    
    def post(self, request, *args, **kwargs):
        dataRequest = request.data  # Lấy dữ liệu từ body của request
        print("POST ::", dataRequest)

        # Nhập công việc và thành phố thông qua input box
        job = dataRequest.get('job')
        city = dataRequest.get('city')
        print(job, city)


        # Đọc dữ liệu từ file CSV
        data = pd.read_csv('./aimodels/model/job_postings_dataset.csv')
        # data = pd.read_csv('./aimodels/model/data.csv')

        columns_to_drop = ["id", "major", "level"]
        if set(columns_to_drop).issubset(data.columns):
            data = data.drop(columns=columns_to_drop)
        else:
            print(f"Các cột sau không tồn tại trong dữ liệu: {set(columns_to_drop) - set(data.columns)}")
        if "time" in data.columns:
            data["time"] = pd.to_datetime(data["time"], unit="ms")
            # Thêm cột 'month' với chu kỳ tháng từ cột 'time'
            data["month"] = data["time"].dt.to_period("M")
            data["month"] = data["month"].dt.start_time
        else:
            print("Cột 'time' không tồn tại trong dữ liệu.")
            exit()


# Gộp dữ liệu
        data = data.pivot_table(index=["job", "city", "month"], aggfunc='size').reset_index(name="job_postings_count")



# # Nhóm dữ liệu theo 'job' và 'city'
#         data = data.groupby(['job', 'city'])

        # Tạo cột 'job_city' bằng cách gộp 'job' và 'city'
        if 'job' not in data.columns or 'city' not in data.columns:
            raise ValueError("Dữ liệu phải chứa cột 'job' và 'city'.")
        data["job_city"] = data["job"] + " - " + data["city"]

        # Chuẩn hóa cột 'job_postings_count'
        scaler = MinMaxScaler(feature_range=(0, 1))
        data["job_postings_count_scaled"] = scaler.fit_transform(
            data["job_postings_count"].values.reshape(-1, 1)
        )

        # Load các mô hình đã lưu
        models_dir = "./aimodels/model/models1/"
        models = {}

        # In tất cả các tên file mô hình có trong thư mục để kiểm tra
        print("Các mô hình có trong thư mục:")
        for model_file in os.listdir(models_dir):
            print(f"Đang tìm mô hình: {model_file}")  # In ra tên mô hình trong thư mục

            # Chỉ xử lý các file mô hình có hậu tố '_model.keras'
            if model_file.endswith("_model.h5"):
                job_city = model_file.replace("_model.h5", "").strip()  # Loại bỏ phần '_model.keras' và khoảng trắng thừa
                job_city_normalized = remove_accents(job_city)  # Chuẩn hóa tên mô hình
                models[job_city_normalized] = load_model(os.path.join(models_dir, model_file))
        
        print(models)
        # Gọi hàm dự đoán với các giá trị nhập từ người dùng
        data = predict_next_12_months(job, city, models, data, scaler)

        return Response(data, status=status.HTTP_201_CREATED)
    
    def put(self, request, *args, **kwargs):
        data = request.data
        return Response({"message": "PUT request thành công", "updated_data": data}, status=status.HTTP_200_OK)
    
    def patch(self, request, *args, **kwargs):
        data = request.data
        return Response({"message": "PATCH request thành công", "patched_data": data}, status=status.HTTP_200_OK)
    
    def delete(self, request, *args, **kwargs):
        return Response({"message": "DELETE request thành công"}, status=status.HTTP_204_NO_CONTENT)
