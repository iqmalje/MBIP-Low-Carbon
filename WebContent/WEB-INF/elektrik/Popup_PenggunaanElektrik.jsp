<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <jsp:include page="/WEB-INF/components/header.jsp" />
    <c:set var="bulans" value="${['Januari', 'Februari', 'March', 'April', 'May', 'Jun', 'Julai', 'Ogos', 'September', 'Oktober', 'November', 'Disember']}" scope="page" />

    <div class="popup-con">
      
      <div class="salinan-header">
        Maklumat Bil Penggunaan
        <div class="yellow-line"></div>
      </div> 
      <div class="penggunaan-header center">Penggunaan Elektrik Semasa</div>
      <div class="bulan-header">${bulans[bulan - 1]} ${tahun}</div>

      <div class="calculator-con">
        <div class="row">
          <div class="in-calculator-font">Jumlah bilangan hari:</div>
  
          <div class="input-box">
            <input
              type="number"
              min="0"
              max="31"
              placeholder="Masukkan bilangan hari"
              value="${elektrik.bil_hari}"
            />
          </div>
        </div>
  
        <div class="row">
          <div class="in-calculator-font">Faktor Prorata:</div>
  
          <div class="input-box">
            <input
              type="number"
              min="0"
              max="31"
              placeholder="Masukkan protata"
              value="${elektrik.prorata}"
            />
          </div>
        </div>
  
        <div class="in-calculator-font">Nilai Penggunaan Elektrik Semasa:</div>
  
        <div class="row horizontal-center">
          <div class="input-box" style="width: 100px;">
            <input type="number" placeholder="0" value="${elektrik.tenaga_elektrik}"/>
          </div>
  
          <div class="in-calculator-font">(kWh)</div>
  
          <div class="input-box" style="width: 100px;">
            <input type="number" min="0" max="31" placeholder="00.00" value="${elektrik.harga_elektrik}"  />
          </div>
  
          <div class="in-calculator-font">(RM)</div>
        </div>
      </div>

      <div class="muat-naik-con upload-column">
        <div class="muat-naik-fail">
          <%-- <input type="file" id="fileInput" style="display: none" />
          <label for="fileInput" class="file-label">
            <!-- You can add an icon or text here as the clickable content -->
            Tekan untuk muat naik
          </label> --%>
          <c:if test="${elektrik.getFail_url() ne null}">
            <c:set var="kategori" value="elektrik"/>
            <embed src="/MBIP-Low-Carbon/file/getfile/${elektrik.getAkaun_id()}/${elektrik.getBulan()}/${elektrik.getTahun()}/${kategori}"
                   style="height: 100%; width: 100%;"></embed>
          </c:if>
        </div>
      </div>
    </div>

  </body>
</html>
