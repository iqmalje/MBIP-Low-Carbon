<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pengurusanData_senaraiKawasan.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
    <link href='${pageContext.request.contextPath}/resources/css/https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <title>Senarai Kawasan</title>
</head>
<body>
    <!--TOPBAR-->
    <jsp:include page="/WEB-INF/components/header.jsp" />    

<!--PENGURUSAN DATA-->
<div class="centerDiv">
    <div class="">
        <div class="pageTitle-container">
            <div class="toLeft">
                <div class="pageTitle-stripe">
                    <h1>Pengurusan Data Karbon Peserta</h1>
                </div>
            </div>
        </div> 
        <div class="senaraiPeserta-subtitle">
            Kakitangan MBIP boleh menggunakan halaman ini untuk mengira data penggunaan peserta, mengemas kini <br>
            peta penggunaan karbon dan memuat turun bil penggunaan perserta.
        </div>

        <br><div class="customDivider"></div><br>

        <div class="header2-container">
            <div class="header2">Senarai Kawasan</div>
            <div class="returnPage-container">
                <img src="${pageContext.request.contextPath}/resources/images/previous icon.png" alt="">
                <a href="/MBIP-Low-Carbon/auth/admin/dashboard" style="padding-left: 10px">Kembali ke Paparan Utama</a>
            </div>
        </div>

        <!--SENARAI PESERTA-->
        <div class="senaraiPeserta-data-container">
            <div class="">
                <table>
                    <tr>
                        <th>Bil.</th>
                        <th style="width: 300px;">Nama Kawasan</th>
                        <th style="width: 100px; text-align: center;">DUN</th>
                        <th style="width: 100px; text-align: center;">Parlimen</th>
                        <th>Status</th>

                        
                    </tr>
                    <c:forEach items="${kawasanlist}" var="kawasan" varStatus="loop">
                        <tr>
                            <td class="bil">${loop.index+1}</td> 
                            <td style="width: 300px;">${kawasan.getNAMA()}</td>
                            <td style="width: 100px; text-align: center;">${kawasan.getDUN()}</td>
                            <td style="width: 100px; text-align: center;">${kawasan.getPARLIMEN()}</td>
                            <td>
                                <div class="statusPenyertaan-container">
                                    <div class="status2-container">
                                        <div class="theStatus2">bahaya</div>
                                    </div>
                                    <a href="/MBIP-Low-Carbon/auth/admin/kawasan/${kawasan.getKawasan_id()}">
                                        <div class="lihatPenuh-container">
                                            lihat penuh
                                        </div>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    
                </table>
            </div>
        </div>

    </div>


</div>
<br><br>
</body>
</html>