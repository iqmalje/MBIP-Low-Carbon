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
    <title>Senarai Kawasan</title>
</head>
<body>
    <!--TOPBAR-->
    <jsp:include page="/WEB-INF/components/header.jsp" />    
    <c:set var="bulans" value="${['Januari', 'Februari', 'March', 'April', 'May', 'Jun', 'Julai', 'Ogos', 'September', 'Oktober', 'November', 'Disember']}" scope="page" />


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

        <div class="containerAtas">
            <div class="">
                    <div class="letakTepi">
                        <button>
                            Sunting
                        </button>
                    </div>

                    <h1 style="font-size: 20px;">${pertandingan.name}</h1>

                    <p style="padding-top: 20px;"><b>Status Pertandingan: </b> ${pertandingan.status}</p>

                <table style="justify-content: center; margin-top: 20px;">
                    <tr>
                        <td><b>Bulan Bermula</b></td>
                        <td><b>Bulan Berakhir</b></td>
                        <td><b>Tempoh Pertandingan</b></td>
                    </tr>
                    <tr>
                        <td>${bulans[pertandingan.start_month - 1]} 2023</td>
                        <td>${bulans[pertandingan.end_month - 1]} 2023</td>
                        <td>${pertandingan.end_month - pertandingan.start_month + 1} Bulan</td>
                    </tr>
                </table>

                <p style="padding-top: 20px;"><b>Kategori Karbon:</b> ${pertandingan.kategori}</p>

                <p style="padding-top: 20px;"><b>Jumlah Kawasan:</b> 30</p>

                <p style="padding-top: 20px;"><b>Jumlah Peserta:</b> ${totalpeserta}</p>
            </div>
        </div>

        <div class="header2-container">
            <div class="header2">Senarai Kawasan</div>
            <div class="returnPage-container">
                <img src="${pageContext.request.contextPath}/resources/images/previous icon.png" alt="">
                <a href="/MBIP-Low-Carbon/auth/admin/dashboard" style="padding-left: 10px">Kembali ke Paparan Utama</a>
            </div>
        </div>

        <div class="center-div">
            <div class="search-box">
                    <div class="search-icon" >
                        <img src="${pageContext.request.contextPath}/resources/images/searchIcon.png">
                    </div>
                    <p class="search-text">Cari kawasan melalui pencarian nama kawasan</p>
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
                    <c:forEach items="${kawasanList}" var="kawasan" varStatus="loop">
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