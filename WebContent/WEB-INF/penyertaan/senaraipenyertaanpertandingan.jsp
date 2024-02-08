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
    <div class="bottom-area"></div>

    <div class="salinan-header">
      Pernyertaan Pertandingan
      <div class="yellow-line"></div>
    </div>

    <div class="centerTab">
      <button class="submitFormTakTekan" style="width: 300px;" onclick="window.location='senarai'">
        
          Senarai Pertandingan
        
      </button>
        <div style="width: 50px;"> </div>
      <button class="submitFormTekan" style="width: 300px;">
        
          Penyertaan Anda
        
      </button>
    </div>

    <div class="text-font center">
        Berikut menerupakan senarai pertandingan yang anda telah menyertai bagi MBIP Rendah Karbon. <br>
        Anda boleh menyemak status penyertaan anda di sini.
      </div>

    <div class="table-con">
      <table style="width:100%">
        <tr>
          <th>Bil</th>
          <th>Nama Pertandingan</th>
          <th>Status</th>
          <th>Paparan Penuh</th>
        </tr>
        <c:forEach items="${items}" var="penyertaan" varStatus="loop">
          <tr>
            <td>${loop.index + 1}</td>
            <td style="text-align: start;">${penyertaan.pertandingan.name}</td>
            <td>
              <div class="centerElement">
                <div style="width: 130px; height: 30px; background: #F9A13B; border-radius: 16px;">
                    <div class="substatus">
                        ${penyertaan.status}
                    </div>
                </div>
            </td>
            <td style="color: blue;"><u><a href="viewdetails/${penyertaan.pertandingan_id}">Lihat</a></u></td>
          </tr>
        </c:forEach>
        

        
      </table>
    </div>

    
    

  </body>
</html>
