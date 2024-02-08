<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ciptaAkaun.css">
    <link href='${pageContext.request.contextPath}/resources/css/https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <title>Cipta Akaun Baharu</title>
</head>
<body>
    <!--TOPBAR-->
    <div class="topbar">
        <!--competetion image-->
            <img id="top" src="${pageContext.request.contextPath}/resources/images/logo pertandingan.png" alt="Pertandingan Kalender Rendah Karbon">
    </div>

    <!--CREATE ACCOUNT-->
    
    <div class="centerDiv">
        <div class="ciptaAkaun-container">
            <form action="/MBIP-Low-Carbon/auth/register" method="POST">
                <div class="pageTitle">Cipta Akaun Baharu</div>
                <input class="inputFeild" type="text" name="fullname" placeholder="Nama penuh" required><br>
                <input class="inputFeild" type="email" name="email" placeholder="E-mel" required><br>
                <input class="inputFeild" type="password" name="password" placeholder="Kata laluan" required><br>
                <input class="inputFeild" type="password" name="retypePassword" placeholder="Ulang kata laluan" required><br>
                <div class="termaDanSyarat">
                    <input type="checkbox" name="agreeTNC" value="tnc" required>
                    <div class="tnctext">Saya terima Terma & Syarat</div>
                </div>
                <div class="daftarButton-container">
                        <input class="daftarButton" type="submit" value="Daftar">
                </div>
            </form>
        </div>
    </div>


    
</body>
</html>