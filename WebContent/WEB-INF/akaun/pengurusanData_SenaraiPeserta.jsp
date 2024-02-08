<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pengurusanData_senaraiPeserta.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
    <link href='${pageContext.request.contextPath}/resources/css/https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <title>Senarai Peserta</title>
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
            <div class="header2">Senarai Peserta</div>
            <div class="returnPage-container">
                <img src="${pageContext.request.contextPath}/resources/images/previous icon.png" alt="">
                <a href="/MBIP-Low-Carbon/auth/admin/dashboard" style="padding-left: 10px;">Kembali ke Paparan Kawasan</a>
            </div>
        </div>

        <!--SENARAI PESERTA-->
        <div class="senaraiPeserta-data-container">
            <div class="">
                <table>
                    <tr>
                        <th>Bil.</th>
                        <th style="width: 350px;">Nama Peserta</th>
                        <th style="width: 100px; text-align: center;">Kategori</th>
                        <th>Status Penyertaan</th>
                    </tr>
                      
                    <c:forEach items="${users}" var="user" varStatus="loop">
                        <tr>
                            <td class="bil">${loop.index+1}</td> 
                            <td style="width: 350px;">${user.getNamaPenuh()}</td>
                            <td style="width: 100px; text-align: center;">${user.getAlamat().getKategori()}</td>
                            <td>
                                <div class="statusPenyertaan-container">
                                    <div class="status2-container">
                                        <div class="theStatus2" style="background-color:${user.isComplete() && user.alamat.isComplete() ? 'green' : 'red'}">${user.isComplete() && user.alamat.isComplete() ? 'Lengkap' : 'Tidak Lengkap'}</div>
                                    </div>
                                    <a href="/MBIP-Low-Carbon/auth/admin/peserta/${user.getAkaun_id()}">
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