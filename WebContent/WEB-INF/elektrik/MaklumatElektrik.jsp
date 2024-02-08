<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/MaklumatPenggunaan.css"
    />
  </head>
  <body>
    <!--TOP BAR AREA -->
    <jsp:include page="/WEB-INF/components/header.jsp"></jsp:include>

     <c:set var="bulan" value="${['Januari', 'Februari', 'March', 'April', 'May', 'Jun', 'Julai', 'Ogos', 'September', 'Oktober', 'November', 'Disember']}" scope="page" />

    <!-- JENIS PENGGUNAAN AREA -->
    <div class="salinan-header">
      Rekod Penggunaan Karbon Anda

      <div class="yellow-line"></div>
    </div>

    <form action="insertElektrik_nilai" method="GET">
      <div class="tahun-kategori-cari-con">
        <div class="pilih-tahun-con pilih-con">
          <select name="tahun">
            <option class="grey-text" value="" disabled selected>
              Pilih Tahun
            </option>
            <option value="2021" ${elektrik.getTahun() eq '2021' ? 'selected' : ''} >2021</option>
            <option value="2022" ${elektrik.getTahun() eq '2022' ? 'selected' : ''}>2022</option>
            <option value="2023" ${elektrik.getTahun() eq '2023' ? 'selected' : ''}>2023</option>
            <option value="2024" ${elektrik.getTahun() eq '2024' ? 'selected' : ''}>2024</option>
          </select>
        </div>
        <div class="pilih-kategori-con pilih-con">
          <select name="bulan">
            <option class="grey-text" value="" disabled selected>
              Pilih Bulan
            </option>
            <option value="1" ${elektrik.getBulan() eq '1' ? 'selected' : ''}>Januari</option>
            <option value="2" ${elektrik.getBulan() eq '2' ? 'selected' : ''}>Febuari</option>
            <option value="3" ${elektrik.getBulan() eq '3' ? 'selected' : ''}>Mac</option>
            <option value="4" ${elektrik.getBulan() eq '4' ? 'selected' : ''}>April</option>
            <option value="5" ${elektrik.getBulan() eq '5' ? 'selected' : ''}>Mei</option>
            <option value="6" ${elektrik.getBulan() eq '6' ? 'selected' : ''}>Jun</option>
            <option value="7" ${elektrik.getBulan() eq '7' ? 'selected' : ''}>Julai</option>
            <option value="8" ${elektrik.getBulan() eq '8' ? 'selected' : ''}>Ogos</option>
            <option value="9" ${elektrik.getBulan() eq '9' ? 'selected' : ''}>September</option>
            <option value="10" ${elektrik.getBulan() eq '10' ? 'selected' : ''}>October</option>
            <option value="11" ${elektrik.getBulan() eq '11' ? 'selected' : ''}>November</option>
            <option value="12" ${elektrik.getBulan() eq '12' ? 'selected' : ''}>December</option>
          </select>
        </div>
        <input type="hidden" name="kategori" value="${kategori}" />
        <div class="pilih-cari-con centerElement">
          <button type="submit" class="cari-button" >Cari</button>
        </div>
      </div>
    </form>

    <div class="center">Sila pilih jenis penggunaan semasa dibawah:</div>

    <!-- TODO: LINK DEKAT PAGE -->
    <div class="pilih-jenis-penggunaan-con center">
      <div class="elektrik-con penggunaan-con">Elektrik</div>

      <div class="penggunaan-con">
      <a href="<%= request.getContextPath() %>/penggunaanAir/insertAir_nilai?tahun=${param.tahun}&bulan=${param.bulan}&kategori=air">Air</a>
      </div>

      <div class="penggunaan-con">
        <a href="<%= request.getContextPath() %>/penggunaanKitarSemula/insertKitarSemula_nilai?tahun=${param.tahun}&bulan=${param.bulan}&kategori=kitarsemula">Kitar Semula</a>
        </div>
    </div>
    <!-- --------------------- -->

 
    <div class="grey-line"></div>

    <div class="penggunaan-header center">Penggunaan Elektrik Semasa</div>

    <div class="desc center">
      Mohon merujuk kepada maklumat berikut bagi tujuan pengisian
    </div>

    <div class="penggunaan-image-con">
      <img src="${pageContext.request.contextPath}/resources/images/guide-elektrik.png" alt="Guide Elektrik Image">
  </div>

    <!-- TODO: YEAR N MONTH BASED ON USER INPUT -->
    <c:set var = "tahun" value="${param.tahun}" />
    <div class="bulan-header">${bulan[elektrik.getBulan()-1]} ${tahun}</div>
    <!-- -->

    <div class="desc center">
      Sila masukkan maklumat penggunaan bil elektrik semasa anda di ruangan
      berikut:
    </div>

    <form action="updateElektrik_nilai" method="get">
    <div class="calculator-con">
        <!-- JUMLAH BILANGAN HARI-->
        <div class="row">
          <div class="in-calculator-font">Jumlah bilangan hari:</div>
          <div class="input-box">
            <input
              type="number"
              min="1"
              max="31"
              placeholder="Masukkan bilangan hari"
              name="bil_hari"
              value="${elektrik.getBil_hari()}"
            />
          </div>
        </div>

        <!-- FAKTOR PRORATA -->
        <div class="row">
          <div class="in-calculator-font">Faktor Prorata:</div>

          <div class="input-box">
            <input
              type="number"
              min="0"
              placeholder="Masukkan protata"
              name="prorata"
              value="${elektrik.getProrata()}"
            />
          </div>
        </div>

        <!-- NILAI PENGGUNAAN SEMASA -->
        <div class="in-calculator-font">Nilai Penggunaan Elektrik Semasa:</div>
        <div class="row horizontal-center">
          <div class="input-box">
            <input type="number" placeholder="0" name="tenaga_elektrik" value="${elektrik.getTenaga_elektrik()}"/>
          </div>
          <div class="in-calculator-font">(kWh)</div>

          <div class="input-box">
            <input type="number" min="0" placeholder="00.00" name="harga_elektrik" value="${elektrik.getHarga_elektrik()}" />
          </div>
          <div class="in-calculator-font">(RM)</div>
        </div>

        <!-- SUBMIT BUTTON -->
        <input type="hidden" name="bulan" value="${elektrik.getBulan()}">
        <input type="hidden" name="tahun" value="${tahun}">
        <button type="submit" class="in-calculator-font center submit-button">
          Simpan
        </button>
    </div>
    </form>
    

    <div class="desc center">
      Sila muat naik bukti salinan bil elektrik semasa anda di ruangan berikut:
    </div>

    <form action="/MBIP-Low-Carbon/penggunaanElektrik/uploadfile" enctype="multipart/form-data" method="POST">
      <div class="muat-naik-con upload-column">
        <!-- UPLOAD FILE -->
        <div class="muat-naik-fail">

          <c:if test="${elektrik.getFail_url() ne null}">
            <c:set var="kategori" value="elektrik"/>
            <embed src="/MBIP-Low-Carbon/file/getfile/${elektrik.getAkaun_id()}/${elektrik.getBulan()}/${elektrik.getTahun()}/${kategori}"
                   style="height: 466px; width: 17vw;"></embed>
          </c:if>

          <input type="file" name="filePDF" id="fileInput" style="display: none"/>
          <input type="hidden" value="${elektrik.getBulan()}" name="bulan" />
          <input type="hidden" value="${tahun}" name="tahun" />
          
          <label for="fileInput" class="file-label">
            Tekan untuk muat naik
          </label>
        </div>
        <!-- MUAT NAIK -->
        <button type="submit" class="in-calculator-font center submitForm1">
          Muat Naik
        </button>
      </div>
    </form>

    <jsp:include page="/WEB-INF/components/menu.html"></jsp:include>
  </body>
</html>
