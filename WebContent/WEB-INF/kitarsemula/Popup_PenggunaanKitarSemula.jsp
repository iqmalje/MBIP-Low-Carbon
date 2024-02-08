<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<html>
  <head>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/Popup_PenggunaanPeserta.css"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>
  <body>
    

    <!-- JENIS PENGGUNAAN AREA -->
    

    <div class="popup-con">
      <div class="letakhujung">
        <div class="circle">
          <img src= "${pageContext.request.contextPath}/resources/images/closeIcon.png" alt="Ikon Tutup" width="25px" height="25px">
        </div>
      </div>
      <div class="salinan-header">
        Maklumat Bil Penggunaan
        <div class="yellow-line"></div>
      </div>
      <div class="penggunaan-header center">Aktiviti Kitar Semula</div>
      <div class="bulan-header">Januari 2023</div>
      <div class="calculator-con">
        <div class="in-calc-header">Jumlah bahan kitar semula terkumpul:</div>
        <div class="row">
          <div class="input-box">
            <input
              type="number"
              min="0"
              max="31"
              placeholder="Masukkan bilangan hari"
            />
          </div>
          <div class="in-calculator-font">(KG)</div>
        </div>
        <div class="row">
          <div class="input-box">
            <input
              type="number"
              min="0"
              max="31"
              placeholder="Masukkan protata"
            />
          </div>
          <div class="in-calculator-font">(RM atau Nilai Collect Point)</div>
        </div>
      </div>
      <div class="muat-naik-con upload-column">
        <div class="muat-naik-fail">
          <input type="file" id="fileInput" style="display: none" />
          <label for="fileInput" class="file-label">
            <!-- You can add an icon or text here as the clickable content -->
            Tekan untuk muat naik
          </label>
        </div>
      </div>
    </div>

  </body>
</html>
