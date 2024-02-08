<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/PengurusanDataKarbon.css'>
    </head>
    <body>

        <!--TOP BAR AREA -->
    <jsp:include page="/WEB-INF/components/header.jsp"></jsp:include>

    <!-- JENIS PENGGUNAAN AREA -->

    <div class="bottom-area">
     </div>

    <div class="salinan-header">
        
            Salinan Bukti Bil Penggunaan Semasa

        <div class="yellow-line">
        </div>
    </div>
    <br />
    <div class="pilihan-header">
        Kakitangan MBIP boleh menggunakan halaman ini untuk mengira data penggunaan peserta, mengemas kini 
        peta penggunaan karbon dan memuat turun bil penggunaan perserta.
    </div>

    <div class="grey-line">
    </div>

    <div class="center-div">
        <div class="big-white-box">
            <div class="center-div">
                <div class="ringkasan-header">
                Ringkasan Keseluruhan Penggunaan Karbon
                </div>
            </div>

            <div class="center-div">
                <div class="box-row1">
                    <div class="center-div">
                        <div class="keluaran-karbon-text">
                            Pengeluaran Karbon <br>
                            <div class="text-flex"> ${totalKarbon}  
                                <p class="co2-small">(kg of CO2)</p> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="center-div">
                <div class="box-row2">
                    <div class="kotak1 kotak-kuning">
                        <p class="text">Potensi Pelepasan Pengurangan (tCO2eq)</p>
                        <br>
                        <p class="text2">95,130,000</p>
                    </div>
        
                    <div class="kotak2 kotak-kuning">
                        <p class="text">Penyertaan <br> Peserta</p>
                        <p class="text2">${totalPeserta}</p>
                    </div>
        
                    <div class="kotak3 kotak-kuning">
                        <p class="text">Potensi Pengurangan pada  <br> Pelepasan GHG Mutlak</p>
                        <p class="text2">41%</p>
                    </div>
                </div>
            </div>

            <div class="center-div">
                <div class="box-row3">
                    <div class="kotak1 kotak-kuning">
                        <p class="text">Elektrik <br>   (Kg of CO2)</p>
                        <p class="text2">${totalElektrik}</p>
                    </div>
        
                    <div class="kotak2 kotak-kuning">
                        <p class="text">Air  <br>   (Kg of CO2)</p>
                        <p class="text2">${totalAir}</p>
                    </div>
        
                    <div class="kotak3 kotak-kuning">
                        <p class="text">Kitar Semula   <br>   (Kg of CO2)</p>
                        <p class="text2">${totalKitarSemula}</p>
                    </div>
                </div>
            </div>
            

            <a href="/MBIP-Low-Carbon/auth/admin/senaraikawasan">
                <div class="senarai-btn">
                    Lihat Senarai Penuh Kawasan
                </div>
            </a>
        </div>
    </div>

    

    </body>

</html>