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
  <c:set var="bulans" value="${['Januari', 'Februari', 'March', 'April', 'May', 'Jun', 'Julai', 'Ogos', 'September', 'Oktober', 'November', 'Disember']}" scope="page" />
    <!-- JENIS PENGGUNAAN AREA -->

    <div class="salinan-header">
      Rekod Penggunaan Karbon Anda

      <div class="yellow-line"></div>
    </div>

    
      <form action="" class="formAlign">
        <div class="tahun-kategori-cari-con">
          <select select class="pilih-con" name="tahun">
            <option class="grey-text" value="" disabled selected>
              Pilih Tahun
            </option>
            <option value="2021" ${kitarsemula.getTahun() eq '2021' ? 'selected' : ''}>2021</option>
            <option value="2022" ${kitarsemula.getTahun() eq '2022' ? 'selected' : ''}>2022</option>
            <option value="2023" ${kitarsemula.getTahun() eq '2023' ? 'selected' : ''}>2023</option>
            <option value="2024" ${kitarsemula.getTahun() eq '2024' ? 'selected' : ''}>2024</option>
          </select>
        
        
          <select class="pilih-con" style="width: 200px;" name="bulan">
            <option class="grey-text" value="" disabled selected>
              Pilih Bulan
            </option>
            <option value="1" ${kitarsemula.getBulan() eq '1' ? 'selected' : ''}>Januari</option>
            <option value="2" ${kitarsemula.getBulan() eq '2' ? 'selected' : ''}>Febuari</option>
            <option value="3" ${kitarsemula.getBulan() eq '3' ? 'selected' : ''}>Mac</option>
            <option value="4" ${kitarsemula.getBulan() eq '4' ? 'selected' : ''}>April</option>
            <option value="5" ${kitarsemula.getBulan() eq '5' ? 'selected' : ''}>Mei</option>
            <option value="6" ${kitarsemula.getBulan() eq '6' ? 'selected' : ''}>Jun</option>
            <option value="7" ${kitarsemula.getBulan() eq '7' ? 'selected' : ''}>Julai</option>
            <option value="8" ${kitarsemula.getBulan() eq '8' ? 'selected' : ''}>Ogos</option>
            <option value="9" ${kitarsemula.getBulan() eq '9' ? 'selected' : ''}>September</option>
            <option value="10" ${kitarsemula.getBulan() eq '10' ? 'selected' : ''}>October</option>
            <option value="11" ${kitarsemula.getBulan() eq '11' ? 'selected' : ''}>November</option>
            <option value="12" ${kitarsemula.getBulan() eq '12' ? 'selected' : ''}>December</option>
          </select>
        
          <div class="pilih-con cari-button">
            <button type="submit" class="cari-button">Cari</button>
        </div>
        </div>
      </form>

    <div class="center">Sila pilih jenis penggunaan semasa dibawah:</div>


    <div class="pilih-jenis-penggunaan-con center"a>
      <div class="penggunaan-con">
        <a href="<%= request.getContextPath() %>/penggunaanElektrik/insertElektrik_nilai?tahun=${param.tahun}&bulan=${param.bulan}&kategori=elektrik">Elektrik</a>
      </div>

      <div class="penggunaan-con">
        <a href="<%= request.getContextPath() %>/penggunaanAir/insertAir_nilai?tahun=${param.tahun}&bulan=${param.bulan}&kategori=air">Air</a>
      </div>

      <div class="kitar-semula-con penggunaan-con">
        Kitar Semula
      </div>
    </div>

    <div class="grey-line"></div>

    <div class="penggunaan-header center">Hasil Kitar Semula Semasa</div>

    <div class="bulan-header">${bulans[bulan - 1]} ${tahun}</div>

    <div class="desc center">
      Sila masukkan maklumat penggunaan bil kitar semula semasa anda di ruangan
      berikut:
    </div>

    <div class="calculator-con">
      <div class="in-calc-header">Jumlah bahan kitar semula terkumpul:</div>

      <form action="/MBIP-Low-Carbon/penggunaanKitarSemula/updateKitarSemula_nilai">
        <div class="row">
          <div class="input-box">
            <input
              type="number"
              min="0"
              max="31"
              placeholder="Masukkan jisim bahan"
              name="jisim_bahan"
              value="${kitarsemula.jisim_bahan}"
            />
          </div>
          <div class="in-calculator-font">(KG)</div>
        </div>
        <br />
        
        <div class="row">
          <div class="input-box">
            <input
              type="number"
              min="0"
              max="31"
              placeholder="Masukkan Nilai Collect Point"
              name="nilai_collect_point"

              value="${kitarsemula.nilai_collect_point}"
            />
          </div>
          <div class="in-calculator-font">(RM atau Nilai Collect Point)</div>
        </div>
        <br />
        <br />
        <input type="hidden" name="bulan" value="${bulan}">
        <input type="hidden" name="tahun" value="${tahun}">
        <div class="centerElement">
          <button class="submitForm1" type="submit">
            <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                Simpan
            </div>
          </button>
        </div>
      </form>
    </div>

    <div class="desc center">
      Sila muat naik bukti salinan bil kitar semula semasa anda di ruangan
      berikut:
    </div>

    <form action="/MBIP-Low-Carbon/penggunaanKitarSemula/uploadfile" method="POST" enctype="multipart/form-data">
      <div class="muat-naik-con upload-column">
        <div class="muat-naik-fail">
          <c:if test="${kitarsemula.getFail_url() ne null}">
            <c:set var="kategori" value="kitarsemula"/>
            <embed src="/MBIP-Low-Carbon/file/getfile/${kitarsemula.getAkaun_id()}/${kitarsemula.getBulan()}/${kitarsemula.getTahun()}/${kategori}"
                    style="height: 466px; width: 17vw;"></embed>
          </c:if>
          <input type="file" id="fileInput" name="filePDF" style="display: none" />
          <label for="fileInput" class="file-label">
            <!-- You can add an icon or text here as the clickable content -->
            Tekan untuk muat naik
          </label>
        </div>
        <input type="hidden" name="bulan" value="${bulan}">
        <input type="hidden" name="tahun" value="${tahun}">
        <div class="centerElement">
          <button class="submitForm1">
            <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                Muat Naik
            </div>
          </button>
        </div>
      </div>
    </form>

  </body>
</html>
