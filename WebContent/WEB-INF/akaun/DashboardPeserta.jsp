<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/DashboardPeserta.css'>
      </head>   
  <body>
    <!--TOP BAR AREA -->
    <jsp:include page="/WEB-INF/components/header.jsp"></jsp:include>

    <!-- JENIS PENGGUNAAN AREA -->
    <c:set var="bulan" value="${['Januari', 'Februari', 'March', 'April', 'May', 'Jun', 'Julai', 'Ogos', 'September', 'Oktober', 'November', 'Disember']}" scope="page" />

    <div class="bottom-area"></div>

    <div class="salinan-header">
        Rekod Penggunaan Karbon Anda ${kategori}

      <div class="yellow-line"></div>
    </div>

    <c:if test="${notification != null}">
      <script>
        alert('${notification}');
      </script>
    </c:if>

    <div class="three-box-con">


        <!-- Electric Container -->
        <div class="carbon-box electric-box">
            <div class="image-con">
              <img src= "${pageContext.request.contextPath}/resources/images/coverelektrik.png" alt="Gambar Elektrik">
            </div>

            <div class="jenis-karbon-header">
            Elektrik
            </div>

            <div class="pelepasan-karbon-text">
              Pelepasan Karbon
            </div>

            <div class="kiraan-pelepasan-karbon">
              ${totalElektrik} kg CO2
            </div>
          </div>

          <!-- Air Container -->
          <div class="carbon-box air-box">
            <div class="image-con">
              <img src= "${pageContext.request.contextPath}/resources/images/coverair.png" alt="Gambar Air">
            </div>

            <div class="jenis-karbon-header">
            Air
            </div>

            <div class="pelepasan-karbon-text">
              Pelepasan Karbon
            </div>

            <div class="kiraan-pelepasan-karbon">
              ${totalAir} kg CO2
            </div>
          </div>

          <!-- Kitar Semula Container -->
          <div class="carbon-box kitar-semula-box">
            <div class="image-con">
              <img src= "${pageContext.request.contextPath}/resources/images/coverrecycle.png" alt="Gambar Kitar Semula">
            </div>

            <div class="jenis-karbon-header">
            Kitar Semula
            </div>

            <div class="pelepasan-karbon-text">
              Pelepasan Karbon
            </div>

            <div class="kiraan-pelepasan-karbon">
              ${totalKitarSemula} kg CO2
            </div>
          </div>

    </div>

    <div class="status-maklumat-header center">
      Status Maklumat Penggunaan Karbon
    </div>

    <!-- <form action="dashboard" method="GET">
      <div class="tahun-kategori-cari-con ">
        <div class="pilih-con">
            <select name="tahun">
              <option class="grey-text" value="" disabled >Pilih Tahun</option>
              <option value="2021" ${tahun eq '2021' ? 'selected' : ''}>2021</option>
              <option value="2022" ${tahun eq '2022' ? 'selected' : ''}>2022</option>
              <option value="2023" ${tahun eq '2023' ? 'selected' : ''}>2023</option>
              <option value="2024" ${tahun eq '2024' ? 'selected' : ''}>2024</option>
            </select>
        </div>
        <div class="pilih-con">
          <select name="kategori">
            <option class="grey-text" value="" disabled >Pilih Kategori Karbon</option>
            <option value="air" ${kategori eq 'air' ? 'selected' : ''}>Air</option>
            <option value="elektrik" ${kategori eq 'elektrik' ? 'selected' : ''}>Elektrik</option>
            <option value="kitarsemula" ${kategori eq 'kitarsemula' ? 'selected' : ''}>Kitar Semula</option>
          </select>
        </div>
        <button type="submit" class="cari-con">Cari</button>
      
      </div>
    </form> -->

    <form class="formAlign">
      <div class="tahun-kategori-cari-con ">
        
            <select class="pilih-con" name="tahun">
              <option class="grey-text" value="" disabled >Pilih Tahun</option>
              <option value="2021" ${tahun eq '2021' ? 'selected' : ''} >2021</option>
              <option value="2022" ${tahun eq '2022' ? 'selected' : ''} >2022</option>
              <option value="2023" ${tahun eq '2023' ? 'selected' : ''} >2023</option>
              <option value="2024" ${tahun eq '2024' ? 'selected' : ''} >2024</option>
            </select>
        
      
          <select class="pilih-con" style="width: 200px;" name="kategori">
            <option class="grey-text" value="" disabled >Pilih Kategori Karbon</option>
            <option value="air" ${kategori eq 'air' ? 'selected' : ''}>Air</option>
            <option value="elektrik" ${kategori eq 'elektrik' ? 'selected' : ''}>Elektrik</option>
            <option value="kitarsemula" ${kategori eq 'kitarsemula' ? 'selected' : ''}>Kitar Semula</option>
          </select>
        
        <button type="submit" style="width: 100px;">Cari</button>  
      </div>
  </form>

    <div class="grey-line"></div>

    <div class="table-con" style=" margin-bottom:50px">
      <table style="width:100%;">
        <tr>
          <th>Bil</th>
          <th>Bulan</th>
          <th>Status</th>
          <th>Pelepasan Karbon</th>
          <th>Paparan Penuh</th>
        </tr>
        <c:forEach items="${items}" var="air" varStatus="loop">
          <tr>
            <td>${loop.index + 1}</td>
            <td>${bulan[loop.index]}</td>
            <td>${air.isComplete() ? 'Lengkap' : 'Tidak Lengkap'}</td>
            <td>${(air.getPelepasan_karbon() gt 0) ? air.getPelepasan_karbon() : 'Tiada Rekod'}</td>
            <td><a href="/MBIP-Low-Carbon/${controller}/${method}?bulan=${loop.index+1}&tahun=${tahun}&kategori=${kategori}">
                  Buka
                </a>
            </td>
          </tr>
        </c:forEach>
        
      </table>
    </div>
    <br/>
    <br/>
    <br/>
    

    
     
    

  </body>
</html>
