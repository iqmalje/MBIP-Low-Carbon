<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<html>
    <head>
        <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/LogIn.css'>
    </head>
  <body>
    <!--TOP BAR AREA -->
    <jsp:include page="/WEB-INF/components/header.jsp"></jsp:include>

    <!-- JENIS PENGGUNAAN AREA -->
<form action="loginadmin" method="POST">
    <div class="box1">


            
                <div class="box-header">
                    Log masuk (admin)
                </div>
                <div class="input-con ml3vw">
                    <input type="text" placeholder="E-mel" name="email">
                </div>
                <div class="input-con ml3vw">
                    <input type="password" placeholder="Kata laluan" name="password">
                </div>

                <p style="
    margin-left: 3vw;
    color: red;
">${error.getMessage()}</p>
                
                <a href="LogInPeserta.html" class="lupa-kata-laluan ml3vw">
                    Terlupa kata laluan?
                </a>

                
                <button type="submit" class="log-masuk-button">
                    Log masuk
                </button>
          
            


    </div>
  </form>
  </body>
</html>