<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script><!-- jQuery base library needed -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/components/header.jsp" />

    <div class="content">
      <div class="toggle-button" id="toggle-button">
        <img
          id="toggle-img"
          class="toggle-img"
          src="images/malay-logo.png"
          alt=""
          srcset=""
        />
      </div>
      <h1>Profil Peserta</h1>
      <div class="yellow-bar"></div>
      <h2>Maklumat Peribadi</h2>

      <div class="profile-section">
        <img
          class="profile-image"
          src="images/imagetest.png"
          alt=""
          srcset=""
        />
        <form action="/MBIP-Low-Carbon/auth/update" class="input-form">
          <div>
            <div class="label">Nama Penuh:</div>
            <input type="text" name="namaPenuh" class="input" id="" value="${user.getNamaPenuh()}" />
          </div>

          <div class="input-row">
            <div>
              <div class="label">Email:</div>
              <input type="text" name="email" style="width: 300px" value="${user.getEmail()}" readonly />
            </div>
            <div>
              <div class="label">ID Peserta:</div>
              <input type="text" name="akaun_id" style="width: 300px" id="" value="${user.getAkaun_id()}" readonly />
            </div>
          </div>
          <div class="input-row">
            <div>
              <div class="label">No. Kad Pengenalan:</div>
              <input type="text" name="IC_no" style="width: 300px" value="${user.getICNo()}" />
            </div>
            <div>
              <div class="label">No. Telefon:</div>
              <input type="text" name="nombor_telefon" style="width: 300px" id="" value="${user.getNomborTelefon()}" />
            </div>
          </div>
          <div class="input-row">
            <div>
              <div class="label">Institusi (Tempat Bekerja):</div>
              <select name="institusi" class="input-select">
                <option value="sektor-awam" ${user.getInstitusi() eq 'sektor-awam' ? 'selected' : ''}>Sektor Awam</option>
                <option value="sektor-swasta" ${user.getInstitusi() eq 'sektor-swasta' ? 'selected' : ''}>Sektor Swasta</option>
                <option value="sektor-pelajar" ${user.getInstitusi() eq 'sektor-pelajar' ? 'selected' : ''}>Pelajar</option>
              </select>
            </div>
            <div>
              <div class="label">Status Pemohon:</div>
              <select name="status" class="input-select">
                <option value="bujang" ${user.getStatus() eq 'bujang' ? 'selected' : ''}>Bujang</option>
                <option value="kahwin" ${user.getStatus() eq 'kahwin' ? 'selected' : ''}>Kahwin</option>
                <option value="cerai" ${user.getStatus() eq 'cerai' ? 'selected' : ''}>Cerai</option>
                <option value="kematian-pasangan" ${user.getStatus() eq 'kematian-pasangan' ? 'selected' : ''}>Kematian Pasangan</option>
              </select>
            </div>
          </div>
          <div class="input-row" style="justify-content: center">
            <button class="button cancel" type="submit">Sunting Profil</button>
            
          </div>
        </form>
      </div>
      <br />
      <br />
      <!-- ALAMAT SECTION -->
      <h2>Alamat</h2>

      <div class="profile-section">
        <img
          class="profile-image"
          src="images/imagetest.png"
          alt=""
          srcset=""
        />
        <form action="/MBIP-Low-Carbon/auth/updatealamat" class="input-form">
          <div>
            <div class="label">Alamat:</div>
            <textarea name="alamat" rows=5>${user.getAlamat().getAlamat()}</textarea>
          </div>

          <div class="input-row">
            <div>
              <div class="label">Bandar:</div>
              <input type="text" name="bandar" style="width: 300px" value="${user.getAlamat().getBandar()}"  />
            </div>
            <div>
              <div class="label">Poskod:</div>
              <input type="number" name="poskod" style="width: 300px" id="" value="${user.getAlamat().getPoskod()}"  />
            </div>
            <div>
              <div class="label">Kawasan:</div>
              <select class="js-example-basic-single input-select" name="kawasan_id">
                <c:forEach items="${kawasans}" var="kawasan" varStatus="loop">
                  <option value="${kawasan.getKawasan_id()}" ${user.getAlamat().getKawasan_id() eq kawasan.getKawasan_id() ? 'selected' : ''}>${kawasan.getNAMA()}</option>
                </c:forEach>
              </select>
            </div>
          </div>
        
          <div class="input-row">
            <div>
              <div class="label">Kategori:</div>
              <select name="kategori" class="input-select">
                <option value="A1" ${user.getAlamat().getKategori() eq 'A1' ? 'selected' : ''}>A1</option>
                <option value="A2" ${user.getAlamat().getKategori() eq 'A2' ? 'selected' : ''}>A2</option>
                <option value="B" ${user.getAlamat().getKategori() eq 'B' ? 'selected' : ''}>B</option>
              </select>
            </div>
            <div>
              <div class="label">Bilangan isi rumah/institusi/sekolah:</div>
              <input type="number" name="bilangan_isi_rumah" style="width: 300px" id="" value="${user.getAlamat().getBilangan_isi_rumah()}" />
            </div>
          </div>
          <div class="input-row" style="justify-content: center">
            <button class="button cancel" type="submit">Sunting Alamat</button>
            
          </div>
        </form>
      </div>
    </div>
    <br />
    <br />
    <div class="overlay-sijil" id="overlay-sijil">
      <div class="overlay-content">
        <img src="images/sijil.png" width="215" alt="" srcset="" />
        <div class="input-row" style="justify-content: center">
          <div class="button cancel" id="btn-aduan">Aduan</div>
          <div class="button blue" id="btn-muatturun" style="margin-left: 83px">
            Muat turun sijil
          </div>
        </div>
      </div>
    </div>
    <div class="overlay-muat-turun" id="overlay-muat-turun">
      <div class="overlay-content">
        <img src="images/muatturun.png" width="215" alt="" srcset="" />

        <div class="label">Sijil penyertaan berjaya muat turun</div>

        <div class="button blue" id="btn-selesai">Selesai</div>
      </div>
    </div>

    <script>
      var toggle = document.getElementById("toggle-button");
      var toggleimg = document.getElementById("toggle-img");

      var btnsijil = document.getElementById("btn-sijil");
      var btnaduan = document.getElementById("btn-aduan");
      var btnmuatturun = document.getElementById("btn-muatturun");
      var btnselesai = document.getElementById("btn-selesai");

      var overlaysijil = document.getElementById("overlay-sijil");
      var overlaymuatturun = document.getElementById("overlay-muat-turun");

      var checked = false;

      toggle.addEventListener("click", () => {
        checked = !checked;
        toggleimg.classList.toggle("checked", checked);

        console.log("tukar ");
      });
      btnsijil.addEventListener("click", () => {
        overlaysijil.style.display = "block";
      });
      btnaduan.addEventListener("click", () => {
        overlaysijil.style.display = "none";
      });
      btnmuatturun.addEventListener("click", () => {
        overlaysijil.style.display = "none";
        overlaymuatturun.style.display = "block";
      });
      btnselesai.addEventListener("click", () => {
        overlaymuatturun.style.display = "none";
      });

      // In your Javascript (external .js resource or <script> tag)
      $(document).ready(function() {
          $('.js-example-basic-single').select2();
      });
    </script>
  </body>
</html>
