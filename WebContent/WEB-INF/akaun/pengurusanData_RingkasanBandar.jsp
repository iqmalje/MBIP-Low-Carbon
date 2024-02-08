<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pengurusanData_ringkasanBandar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
    <link href='${pageContext.request.contextPath}/resources/css/https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <title>Ringkasan Penggunaan Karbon - Bandar</title>
</head>
<body>
    <!--TOPBAR-->
    <jsp:include page="/WEB-INF/components/header.jsp" />   

<!--PENGURUSAN DATA-->
<div class="centerDiv">
    <div class="pgrsnData-Container">
        <div class="pageTitle-container">
            <div class="toLeft">
                <div class="pageTitle-stripe">
                    <h1>Pengurusan Data Karbon Peserta</h1>
                </div>
            </div>
        </div> 
        <div class="pgrsnData-subtitle">
            Kakitangan MBIP boleh menggunakan halaman ini untuk mengira data penggunaan peserta, mengemas kini <br>
            peta penggunaan karbon dan memuat turun bil penggunaan perserta.
        </div>

        <br><div class="customDivider"></div><br>

        <div style="width: 250px;
        height: 45px;
        background-color: #FFFFFF;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 14px;
        color: #666666;
        border: 1px solid #969696; margin-bottom: 20px;"
        >
            <img src="${pageContext.request.contextPath}/resources/images/previous icon.png" alt="">
            <a href="/MBIP-Low-Carbon/auth/admin/dashboard" style="padding-left: 10px">Kembali ke Paparan Utama</a>
        </div>

        

        <!--RINGKASAN PENGGUNAAN KARBON-->
        <div class="pgrsnData-data-container">
            <!--header 2-->
            <div class="header2">Ringkasan Penggunaan Karbon</div>

            <!--data Bandar-->
            <div class="dataBandar-container">
                <!--data Bandar KIRI-->
                <div class="dataBandar-kiri">
                    <!--nama bandar-->
                    <div class="namaBandar">${kawasan.getNAMA()}</div>
                    <!--koordinat-->
                    <div class="infoBandar-kiri">
                        <p style="width: 80px;">Kategori  </p>
                        <div class="infoBandar-kiri2">: ${kawasan.getKATEGORI()}</div>
                    </div>
                    <!--zon-->
                    <div class="infoBandar-kiri">
                        <p style="width: 80px;">Status</p>
                        <div class="infoBandar-kiri2">: ${kawasan.getSTATUS()}</div>
                    </div>
                    <!--BP-->
                    <div class="infoBandar-kiri">
                        <p style="width: 80px;">Keterangan</p>
                        <div class="infoBandar-kiri2">: ${kawasan.getKETERANGAN()}</div>
                    </div>       
                    <!--BPK-->
                    <div class="infoBandar-kiri">
                        <p style="width: 80px;">Mukim</p>
                        <div class="infoBandar-kiri2">: ${kawasan.getMUKIM()}</div>
                    </div>
                    <!--landmark-->
                    <div class="infoBandar-kiri">
                        <p style="width: 80px;">Luas</p>
                        <div class="infoBandar-kiri2">: ${kawasan.getLUAS()}</div>
                    </div>
                    <div class="infoBandar-kiri">
                        <p style="width: 80px;">DUN</p>
                        <div class="infoBandar-kiri2">: ${kawasan.getDUN()}</div>
                    </div>
                    <div class="infoBandar-kiri">
                        <p style="width: 80px;">Parlimen</p>
                        <div class="infoBandar-kiri2">: ${kawasan.getPARLIMEN()}</div>
                    </div>
                    <div class="infoBandar-kiri">
                        <p style="width: 80px;">Bil. Rumah </p>
                        <div class="infoBandar-kiri2">: ${kawasan.getBIL_RUMAH()}</div>
                    </div>
                    <div class="infoBandar-kiri">
                        <p style="width: 80px;">Bil. Penduduk</p>
                        <div class="infoBandar-kiri2">: ${kawasan.getBIL_PENDUDUK()}</div>
                    </div>
                    
                </div>

                <!--data Bandar KANAN-->
                <div class="dataBandar-kanan">
                    <!--jumlah peserta-->
                    <div class="infoBandar-kanan marginTop">
                        Jumlah Peserta 
                        <div>${jumlahPesertaBandar}</div>
                    </div>
                    <!--penggunaan elektrik-->
                    <div class="infoBandar-kanan">
                        Penggunaan Elektrik (kWh)
                        <div>${jumlahElektrik}</div>
                    </div>
                    <!--penggunaan air-->
                    <div class="infoBandar-kanan">
                        Penggunaan Air (L) 
                        <div>${jumlahAir}</div>
                    </div>
                    <!--penggunaan sisa buangan-->
                    <div class="infoBandar-kanan">
                        Aktiviti Kitar Semula (kg) 
                        <div>${jumlahKitarSemula}</div>
                    </div>
                    
                    <!--jumlah pelepasan CO2-->
                    <div class="jumlahCo2-container">
                        <div class="jumlahC02">${totalKarbon}</div>
                        (kg of CO2)
                    </div>
                </div>
            </div>

            <!--lihat senarai peserta-->
            <div class="viewParticipant-container">
                <a href="/MBIP-Low-Carbon/auth/admin/senaraipeserta/${kawasan.getKawasan_id()}">Lihat Senarai Penuh Peserta</a>
            </div>
        </div>
    </div>

    
    
</div>
<br><br>
</body>
</html>