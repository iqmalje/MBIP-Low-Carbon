<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/resources/css/menu.css"
/>
<div class="menu" id="menu">
  <a href="/MBIP-Low-Carbon/profilepage.jsp">
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
  <a href="/MBIP_Low_Carbon_System/penggunaanSemasa_elektrik.jsp">
    <div class="menu-item">
      <img
        class="menu-img"
        src="${pageContext.request.contextPath}/resources/images/menu_maklumatbil.png"
        alt=""
        srcset=""
      />
      <p class="menu-text">Maklumat Bil</p>
    </div>
  </a>
  <a href="/MBIP_Low_Carbon_System/UploadBilPenggunaanElektrik.jsp">
    <div class="menu-item">
      <img
        class="menu-img"
        src="${pageContext.request.contextPath}/resources/images/menu_salinan.jpeg"
        alt=""
        srcset=""
      />
      <p class="menu-text">Salinan Bukti</p>
    </div>
  </a>
  <a href="/MBIP_Low_Carbon_System/semakDanHantar.jsp">
    <div class="menu-item">
      <img
        class="menu-img"
        src="${pageContext.request.contextPath}/resources/images/menu_semak.png"
        alt=""
        srcset=""
      />
      <p class="menu-text">Semak Pernyataan</p>
    </div>
  </a>
</div>

<script>
  var menutoggle = false;
  var btnmenu = document.getElementById("btn-menu");
  btnmenu.addEventListener("click", () => {
    console.log("TESTT");
    alert("TESTT");
    menutoggle = !menutoggle;

    if (menutoggle) {
      document.getElementById("menu").style.display = "flex";
    } else {
      document.getElementById("menu").style.display = "none";
    }
  });
</script>
