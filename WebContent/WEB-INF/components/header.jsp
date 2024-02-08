<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
 
<div class="header">
      
      <div class="menubutton" id="btn-menu">
        <img src="${pageContext.request.contextPath}/resources/images/menuicon.png" alt="Menu button" srcset="" height="15px"/>
        <div
          style="
            color: black;
            font-size: 17x;
            font-family: Poppins;
            font-weight: 500;
            word-wrap: break-word;
            margin-left: 17px;
          "
        >
          Menu
        </div>
      </div>

      <img
        src="${pageContext.request.contextPath}/resources/images/logo.png"
        alt="MBIP Logo"
        srcset=""
        style="height: 60px"
      />
      <c:if test="${user != null}">
        <button class="submitFormIndex" onclick="window.location='/MBIP-Low-Carbon/auth/logout'">
          Log Keluar
        </button>
      </c:if>
      <c:if test="${user == null}">
        <button class="submitFormIndex" onclick="window.location='/MBIP-Low-Carbon/auth/'">
          Log Masuk
        </button>
      </c:if>
      
    </div>
    <link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/resources/css/menu.css"
/>
<c:if test="${user.getIsAdmin() == false}">
  <div class="menu" id="menu">
    <a href="/MBIP-Low-Carbon/auth/dashboard">
      <div class="menu-item">
        <img
          class="menu-img"
          src="${pageContext.request.contextPath}/resources/images/menu_maklumatbil.png"
          alt=""
          srcset=""
        />
        <p class="menu-text">Dashboard Pengguna</p>
      </div>
    </a>
    
    <a href="/MBIP-Low-Carbon/auth/profile">
      <div class="menu-item">
        <img
          class="menu-img"
          src="${pageContext.request.contextPath}/resources/images/menu_maklumatperibadi.png"
          alt=""
          srcset=""
        />
        <p class="menu-text">Maklumat Peribadi</p>
      </div>
    </a>
    
    <a href="/MBIP-Low-Carbon/penyertaan/senarai">
      <div class="menu-item">
        <img
          class="menu-img"
          src="${pageContext.request.contextPath}/resources/images/menu_semak.png"
          alt=""
          srcset=""
        />
        <p class="menu-text">Pertandingan MBIP Rendah Karbon</p>
      </div>
    </a>
  </div>
</c:if>

<c:if test="${user.getIsAdmin() == true}">
  <div class="menu" id="menu">
    <a href="/MBIP-Low-Carbon/auth/admin/dashboard">
      <div class="menu-item">
        <img
          class="menu-img"
          src="${pageContext.request.contextPath}/resources/images/menu_maklumatbil.png"
          alt=""
          srcset=""
        />
        <p class="menu-text">Pelepasan Karbon MBIP</p>
      </div>
    </a>
    
    <a href="/MBIP_Low_Carbon_System/auth/profile">
      <div class="menu-item">
        <img
          class="menu-img"
          src="${pageContext.request.contextPath}/resources/images/menu_maklumatperibadi.png"
          alt=""
          srcset=""
        />
        <p class="menu-text">Maklumat Peribadi</p>
      </div>
    </a>
    
    <a href="/MBIP-Low-Carbon/penyertaan/admin/senarai">
      <div class="menu-item">
        <img
          class="menu-img"
          src="${pageContext.request.contextPath}/resources/images/menu_semak.png"
          alt=""
          srcset=""
        />
        <p class="menu-text">Pertandingan MBIP Rendah Karbon</p>
      </div>
    </a>
  </div>

</c:if>



<script>
  var menutoggle = false;
  var btnmenu = document.getElementById("btn-menu");
  btnmenu.addEventListener("click", () => {
    menutoggle = !menutoggle;

    if (menutoggle) {
      document.getElementById("menu").style.display = "flex";
    } else {
      document.getElementById("menu").style.display = "none";
    }
  });
</script>