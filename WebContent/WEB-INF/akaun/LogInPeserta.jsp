<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/LogIn.css'>
      </head>   
  <body>

   
    <!--TOP BAR AREA -->
    <jsp:include page="/WEB-INF/components/header.jsp"></jsp:include>

    <!-- JENIS PENGGUNAAN AREA -->
    
    <div class="box1">


            <div class="box-header">
                Log masuk
            </div>

            <form action="/MBIP-Low-Carbon/auth/loginpeserta" method="POST" class="main-form">
                <div class="input-con">
                    <input type="text" placeholder="E-mel" name="email">
                </div>
    <br />
                <div class="input-con">
                    <input type="password" placeholder="Kata laluan" name="password">
                </div>
                 <p style="color: red;">${error.getMessage()}</p>
                
                
                <a href="LogInPeserta.html" class="lupa-kata-laluan">
                    Terlupa kata laluan?
                </a>
                
               <br />
                
                <button type="submit" class="log-masuk-button">
                    Log masuk
                </button>
            </form>


    </div>
    
    <div class="bottom-area"></div>

    <div class="white-box">
        <form action="/MBIP-Low-Carbon/auth/registerformpeserta">
            <button type="submit" class="cipta-akaun-baru">
                Cipta Akaun Baru
            </button>
        </form>        
    </div>

    <a href="loginformadmin" class="log-admin">
        Log Masuk Sebagai Admin
    </a>
    
    
  </body>
</html>
