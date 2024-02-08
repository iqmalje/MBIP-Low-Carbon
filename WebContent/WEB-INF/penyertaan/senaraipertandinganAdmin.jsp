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
  <c:set var="bulans" value="${['Januari', 'Februari', 'March', 'April', 'May', 'Jun', 'Julai', 'Ogos', 'September', 'Oktober', 'November', 'Disember']}" scope="page" />

    <!-- JENIS PENGGUNAAN AREA -->
    <div class="bottom-area"></div>

    <div class="salinan-header">
      Pertandingan MBIP Rendah Karbon
      <div class="yellow-line"></div>
    </div>

    <div class="centerTab">
      <button class="submitFormTekan" style="width: 300px;">
        
          Senarai Pertandingan
        
      </button>
        <div style="width: 50px;"> </div>
      <button class="tambahPertandingan" onclick="window.location='/MBIP-Low-Carbon/penyertaan/admin/addform'" style="width: 300px;">
        
        Tambah Pertandingan
        
      </button>
    </div>

    <div class="text-font center">
        Berikut merupakan senarai pertandingan Rendah Karbon yang dianjurkan oleh Majlis Bandaraya Iskandar Puteri.<br>
      </div>

    <div class="table-con">
      <table style="width:100%">
        <tr>
          <th>Bil</th>
          <th>Nama Pertandingan</th>
          <th>Status</th>
          <th>Lihat Penuh</th>
        </tr>

        <c:forEach items="${pertandinganList}" var="pertandingan" varStatus="loop">
          <tr>
            <td>${loop.index + 1}</td>
            <td style="text-align: start;">${pertandingan.name}</td>
            <td>
              <div class="centerElement">
                <div style="width: 130px; height: 30px; background: #5DC55B; border-radius: 16px;">
                    <div class="substatus">
                        ${pertandingan.status}
                    </div>
                </div>
            </div>
            </td>
            <td style="color: blue;"><u><a href="/MBIP-Low-Carbon/penyertaan/admin/view/${pertandingan.pertandingan_id}">Klik</a></u></td>
          </tr>
        </c:forEach>
        
      </table>
    </div>

    
    

  </body>
</html>
