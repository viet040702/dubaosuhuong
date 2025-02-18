<template>
  <footer class="footer__copyright">
    <div class="footer__copyright-info">
      <div class="footer__copyright-info-left">
        <div class="customer__care">
          <h3>Chăm sóc khách hàng</h3>
          <ul class="customer__care-option">
            <li class="customer__care-option-item">
              <a href="#">Trung Tâm Trợ Giúp</a>
            </li>
            <li class="customer__care-option-item">
              <a href="#">Career Connect Mail</a>
            </li>
            <li class="customer__care-option-item">
              <a href="#">Hướng Dẫn mua Hàng</a>
            </li>
          </ul>
        </div>
        <div class="about__tickid">
          <h3>Về Career Connect</h3>
          <ul class="about__tickid-option">
            <li class="about__tickid-option-item">
              <a href="#">Giới Thiệu về Career Connect Việt Nam</a>
            </li>
            <li class="about__tickid-option-item">
              <a href="#">Tuyển Dụng</a>
            </li>
            <li class="about__tickid-option-item">
              <a href="#">Điều khoản Career Connect</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="footer__copyright-info-right">
        <div class="follow__tickid">
          <h3>Theo dõi chúng tôi trên</h3>
          <ul class="follow__tickid-option">
            <li class="follow__tickid-option-item">
              <a href="#">
                <i class="fab fa-facebook"></i>
                Facebook
              </a>
            </li>
            <li class="follow__tickid-option-item">
              <a href="#">
                <i class="fab fa-instagram"></i>
                Instagram
              </a>
            </li>
            <li class="follow__tickid-option-item">
              <a href="#">
                <i class="fab fa-linkedin"></i>
                Linkedin
              </a>
            </li>
          </ul>
        </div>
        <!-- <div class="container__dowload">
          <h3>Vào Cửa Hàng Trên Ứng Dụng</h3>
          <div class="dowload__app">
            <div class="dowload__app-QR">
              <a href="#">
                <img src="./asset/img/QRcode/QRcode.png" alt="QR code" />
              </a>
            </div>
            <div class="dowload__app-store">
              <div class="appstore">
                <a href="#">
                  <img src="./asset/img/QRcode/appstore.png" alt="Appstore" />
                </a>
              </div>
              <div class="CHplay">
                <a href="#">
                  <img src="./asset/img/QRcode/CHplay.png" alt="CHplay" />
                </a>
              </div>
            </div>
          </div>
        </div> -->
      </div>
    </div>
  </footer>
  <footer class="footer__scurity">
    <div class="footer__scurity-top">
      <ul class="footer__scurity-top-list">
        <li class="footer__scurity-top-item">
          <a href="" class="footer__scurity-top-link">chính sách bảo mật</a>
        </li>
        <li class="footer__scurity-top-item separate__left">
          <a href="" class="footer__scurity-top-link">quy chế hoạt động</a>
        </li>
        <li class="footer__scurity-top-item separate__left">
          <a href="" class="footer__scurity-top-link">chính sách vận chuyển</a>
        </li>
        <li class="footer__scurity-top-item separate__left">
          <a href="" class="footer__scurity-top-link"
            >chính sách chuyển tiền và hoàn tiền</a
          >
        </li>
      </ul>
    </div>
    <div class="footer__scurity-center">
      <div>Công ty TNHH TICKID</div>
    </div>
    <div class="footer__scurity-bottom">
      <div>
        Địa chỉ: Số 189, Nam Cao, Hòa khánh Nam, quận Liên Chiểu, thành phố Đà Nẵng
      </div>
      <div>
        Mã dố doanh nghiệp: 0108838679 do Sở Kế hoạch & Đầu tư TP Đà Nẵng cấp lần
        đầu ngày 10/02/2024
      </div>
      <div>© 2024 - Bản quyền thuộc về Công ty TNHH Career Connect</div>
    </div>
  </footer>
</template>

<script setup lang="ts">
import { ref } from "vue";
</script>

<style scoped>
/* FOTTER */
.footer__copyright {
  background-color: #ffffff;
  padding: 40px 10px;
  border-top: 3px solid #483aa0;
  height: 240px;
}

.footer__copyright ul {
  padding: 0;
  list-style: none;
}

.footer__copyright h3 {
  font-size: 16px;
  color: #686868;
  height: 30px;
  cursor: default;
}

.footer__copyright a {
  font-size: 12px;
  line-height: 1.6;
  color: rgba(85, 85, 85, 0.76);
}

.footer__copyright-info {
  display: flex;
  justify-content: space-between;
}

.footer__copyright-info-left {
  display: flex;
  justify-content: space-between;
  width: 42%;
}

.footer__copyright-info-left a:hover {
  color: #483aa0e7;
}

.customer__care {
  width: 50%;
}

.about__tickid {
  width: 50%;
}

.footer__copyright-info-right {
  display: flex;
  justify-content: end;
  width: 42%;
}

.follow__tickid {
  width: 50%;
}

.follow__tickid-option-item > a:hover {
  opacity: 0.8;
}

.follow__tickid-option-item > a > i {
  font-size: 16px;
  color: rgba(85, 85, 85, 0.9);
  margin-right: 4px;
  line-height: 1.6;
}

.container__dowload {
  width: 50%;
}

.dowload__app {
  margin-top: 15px;
  display: flex;
}

.dowload__app-QR {
  width: 50%;
  background-color: #ffffff;
  border-radius: 2px;
  box-shadow: 0 1px 2px #ccc;
}

.dowload__app-QR img {
  width: 100%;
  padding: 5px;
  display: flex;
  margin: auto;
}

.dowload__app-store {
  padding: 5px 18px 5px 10px;
  width: 50%;
  align-items: center;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
}

.appstore img {
  width: 100%;
}

.CHplay img {
  width: 100%;
}

/* Footer scurity */
.footer__scurity {
  padding-top: 40px;
  background-color: #f5f5f5;
  box-shadow: 0 1px 3px rgb(0 0 0 / 40%);
}

.footer__scurity-top {
  margin: auto;
}

.footer__scurity-top-list {
  font-size: 12px;
  display: flex;
  list-style: none;
  justify-content: space-evenly;
  padding: 0;
}

.separate__left {
  position: relative;
}

.separate__left::after {
  position: absolute;
  content: "";
  border-left: 1px solid #ccc;
  height: 15px;
  top: 0px;
  left: -28px;
}

.footer__scurity-top-item a {
  color: rgba(85, 85, 85, 0.76);
  text-transform: uppercase;
  font-weight: 600;
}

.footer__scurity-center {
  font-size: 12px;
  color: rgba(85, 85, 85, 0.76);
  display: flex;
  flex-direction: column;
  margin: 40px auto 10px;
  width: 160px;
  align-items: center;
}

.footer__scurity-center img {
  width: 100%;
}

.footer__scurity-bottom {
  font-size: 14px;
  line-height: 1.6;
  color: rgba(85, 85, 85, 0.76);
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  padding-bottom: 20px;
}
</style>
