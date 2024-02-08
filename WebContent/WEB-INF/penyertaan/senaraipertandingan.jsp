<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/DashboardPeserta.css'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pop-up.css" />
      </head>   
  <body>
    <!--TOP BAR AREA -->
    <jsp:include page="/WEB-INF/components/header.jsp"></jsp:include>

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
      <button class="submitFormTakTekan" style="width: 300px;" onclick="window.location='senaraiserta'">
        
          Penyertaan Anda
        
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
          <th>Turut Serta</th>
        </tr>

        <c:forEach items="${items}" var="pertandingan" varStatus="loop">
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
            <td style="color: blue;"><u><a onclick="triggerPopup(${pertandingan.pertandingan_id})">Klik</a></u></td>
          </tr>
        </c:forEach>
        
      </table>
    </div>

    <!-- Pop-up container -->
    <div class="popup-container" id="popup-container">
      <div class="popup-header">
          Pengesahan Penyertaan Pertandingan
      </div>

      <div class="popup-desc">
          Sila klik "Setuju" bagi mengesahkan penyertaan anda dalam Pertandingan <br>
          Kalendar Rendah Karbon Iskandar Puteri 2023 bagi siri 1 (Januari hingga Julai). 
      </div>

      <div class="button-container">
          <button type="button" class="popup-button" id="setuju-btn">Setuju</button>
          <button type="button" class="popup-button">Batal</button>
      </div>
  </div>
    
  <script>
    var isPopupEnabled = false;
    var popup = document.getElementById("popup-container");
    var setujubtn = document.getElementById("setuju-btn");
    popup.style.display = "none";
    //"sertai/${pertandingan.pertandingan_id}"
    function triggerPopup(pertandingan_id) {
        isPopupEnabled = !isPopupEnabled
        setujubtn.onclick = function() {window.location = "sertai/" + pertandingan_id};
        if(isPopupEnabled){
            popup.style.display = "block";
        } else {
            popup.style.display = "none";
        }
    }
  </script>
  </body>
</html>
