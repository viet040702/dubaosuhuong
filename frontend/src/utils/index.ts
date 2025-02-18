export const handleConvertTimestampToDate = (timestamp: string) => {
	if(!timestamp) return;
	const date = new Date(Number(timestamp.replace('.0', '')));
	const day = date.getDate();
	const month = date.getMonth() + 1;
	const year = date.getFullYear();

	// Đảm bảo rằng các giá trị ngày và tháng luôn có 2 chữ số
	const formattedDay = String(day).padStart(2, '0');
	const formattedMonth = String(month).padStart(2, '0');

	// Tạo chuỗi ngày/tháng/năm theo định dạng DD/MM/YYYY
	const dateString = `${formattedDay}/${formattedMonth}/${year}`;

	return dateString;
}

export const regex = {
  email: /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
  decimal2: /^[0-9][0-9]{0,16}([.]\d{0,2}|)$/,
  numberThan0: /^[0-9][0-9]*([.][0-9]{2}|)$/,
  positive_integer: /^([0-9][0-9]{0,16})$/,
  password: /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d\W_]{8,}|^(?=.*[a-zA-Z])(?=.*[\W_])[a-zA-Z\d\W_]{8,}|^(?=.*\d)(?=.*[\W_])[a-zA-Z\d\W_]{8,}$/,
}
