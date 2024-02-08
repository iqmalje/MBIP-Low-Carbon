<html>

<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/TurutSerta.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pop-up.css" />
</head>

<body>
    <!-- Grey overlay -->
    <div class="overlay"></div>

    <!-- TOP BAR AREA -->
    <jsp:include page="/WEB-INF/components/header.jsp"></jsp:include>

    <!-- JENIS PENGGUNAAN AREA -->

    <div class="bottom-area"></div>

    <div class="salinan-header">
        Rekod Penggunaan Karbon Anda
        <div class="yellow-line"></div>
    </div>

    <div class="desc">
        Turut serta dalam Pertandingan Kalendar Rendah Karbon Iskandar Puteri 2023 bagi siri 1 (Januari hingga Julai).
        <br />
        Peserta berpeluang memenangi hadiah menarik daripada Majlis Bandaraya Iskandar Puteri.
    </div>

    <div class="image-con"></div>

    <button type="button" class="turut-button">
        <div class="turut-serta-text">Turut Serta Pertandingan</div>
    </button>

    <!-- Pop-up container -->
    <div class="popup-container">
        <div class="popup-header">
            Pengesahan Penyertaan Pertandingan
        </div>

        <div class="popup-desc">
            Sila klik "Setuju" bagi mengesahkan penyertaan anda dalam Pertandingan <br>
            Kalendar Rendah Karbon Iskandar Puteri 2023 bagi siri 1 (Januari hingga Julai). 
        </div>

        <div class="button-container">
            <button type="button" class="popup-button">Setuju</button>
            <button type="button" class="popup-button">Batal</button>
        </div>
    </div>

    <jsp:include page="/WEB-INF/components/menu.html"></jsp:include>
</body>

</html>
