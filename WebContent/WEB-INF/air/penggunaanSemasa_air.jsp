<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/penggunaanSemasa_air.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Poppins"
      rel="stylesheet"
    />
    <title>Maklumat Bil Penggunaan Semasa - Air</title>
  </head>
  <body>
    <!--TOPBAR-->
    <jsp:include page="/WEB-INF/components/header.jsp" />

    <!--PAGE TITLE-->
    <div class="pageTitle-container">
      <div class="pageTitle-stripe">
        <h1>Maklumat Bil Penggunaan Semasa</h1>
      </div>
    </div>

    <!--JENIS PENGUNAAN-->
    <div class="consumpTpye-header">
      Sila pilih jenis penggunaan semasa dibawah:
    </div>
    <div class="consumpTpye-container">
      <div class="notSelected">
        <a href="penggunaanSemasa_elektrik.jsp">Elektrik</a>
      </div>
      <div class="selected">Air</div>
      <div class="notSelected">
        <a href="penggunaanSemasa_kitarSemula.jsp">Kitar Semula</a>
      </div>
    </div>

    <br />
    <div class="customDivider"></div>

    <!--OVERALL STATUS-->
    <div class="overallStatus-container">
      status:
      <div class="statusContainer">tidak lengkap</div>
    </div>

    <!--INSTRUCTION/GUIDE-->
    <div class="guide">
      <div class="guide-header">Penggunaan Air Semasa</div>
      <div class="guide-subheader">
        Mohon merujuk kepada maklumat berikut bagi tujuan pengisian
      </div>
      <img
        src="${pageContext.request.contextPath}/resources/images/guide-air.png"
        alt="Panduan Pengisian Maklumat Bil Elektrik"
      />
    </div>

    <!--MONTHLY DATA-->
    <div class="monthRow">
      <!--JANUARI-->
      <div>
        <div class="monthName">Januari</div>
        <div class="monthlyDataInput-container">
          <!--bilangan hari-->
          <div class="monthlyDataInput-row rowPadding">
            Jumlah bilangan hari:
            <input type="number" class="customTextField" />
          </div>
          <!--faktor prorata-->
          <div class="monthlyDataInput-row rowPadding">
            Faktor Prorata:
            <input type="number" class="customTextField" />
          </div>
          <!--nilai semasa-->
          <div class="rowPadding">Nilai Penggunaan Air Semasa:</div>
          <div class="monthlyDataInput-row2">
            <div>
              <input type="number" class="customTextField2" />
              (kWh)
            </div>
            <div>
              <input type="number" class="customTextField2" />
              (RM)
            </div>
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="overallStatus-container">
              status:
              <div class="statusContainer">tidak lengkap</div>
            </div>
          </div>
        </div>
      </div>

      <!--FEBRUARI-->
      <div>
        <div class="monthName">Februrari</div>
        <div class="monthlyDataInput-container">
          <!--bilangan hari-->
          <div class="monthlyDataInput-row rowPadding">
            Jumlah bilangan hari:
            <input type="number" class="customTextField" />
          </div>
          <!--faktor prorata-->
          <div class="monthlyDataInput-row rowPadding">
            Faktor Prorata:
            <input type="number" class="customTextField" />
          </div>
          <!--nilai semasa-->
          <div class="rowPadding">Nilai Penggunaan Air Semasa:</div>
          <div class="monthlyDataInput-row2">
            <div>
              <input type="number" class="customTextField2" />
              (kWh)
            </div>
            <div>
              <input type="number" class="customTextField2" />
              (RM)
            </div>
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="overallStatus-container">
              status:
              <div class="statusContainer">tidak lengkap</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br /><br />

    <!--MONTHLY DATA-->
    <div class="monthRow">
      <!--MARCH-->
      <div>
        <div class="monthName">March</div>
        <div class="monthlyDataInput-container">
          <!--bilangan hari-->
          <div class="monthlyDataInput-row rowPadding">
            Jumlah bilangan hari:
            <input type="number" class="customTextField" />
          </div>
          <!--faktor prorata-->
          <div class="monthlyDataInput-row rowPadding">
            Faktor Prorata:
            <input type="number" class="customTextField" />
          </div>
          <!--nilai semasa-->
          <div class="rowPadding">Nilai Penggunaan Air Semasa:</div>
          <div class="monthlyDataInput-row2">
            <div>
              <input type="number" class="customTextField2" />
              (kWh)
            </div>
            <div>
              <input type="number" class="customTextField2" />
              (RM)
            </div>
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="overallStatus-container">
              status:
              <div class="statusContainer">tidak lengkap</div>
            </div>
          </div>
        </div>
      </div>

      <!--APRIL-->
      <div>
        <div class="monthName">April</div>
        <div class="monthlyDataInput-container">
          <!--bilangan hari-->
          <div class="monthlyDataInput-row rowPadding">
            Jumlah bilangan hari:
            <input type="number" class="customTextField" />
          </div>
          <!--faktor prorata-->
          <div class="monthlyDataInput-row rowPadding">
            Faktor Prorata:
            <input type="number" class="customTextField" />
          </div>
          <!--nilai semasa-->
          <div class="rowPadding">Nilai Penggunaan Air Semasa:</div>
          <div class="monthlyDataInput-row2">
            <div>
              <input type="number" class="customTextField2" />
              (kWh)
            </div>
            <div>
              <input type="number" class="customTextField2" />
              (RM)
            </div>
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="overallStatus-container">
              status:
              <div class="statusContainer">tidak lengkap</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br /><br />

    <!--MONTHLY DATA-->
    <div class="monthRow">
      <!--MEI-->
      <div>
        <div class="monthName">Mei</div>
        <div class="monthlyDataInput-container">
          <!--bilangan hari-->
          <div class="monthlyDataInput-row rowPadding">
            Jumlah bilangan hari:
            <input type="number" class="customTextField" />
          </div>
          <!--faktor prorata-->
          <div class="monthlyDataInput-row rowPadding">
            Faktor Prorata:
            <input type="number" class="customTextField" />
          </div>
          <!--nilai semasa-->
          <div class="rowPadding">Nilai Penggunaan Air Semasa:</div>
          <div class="monthlyDataInput-row2">
            <div>
              <input type="number" class="customTextField2" />
              (kWh)
            </div>
            <div>
              <input type="number" class="customTextField2" />
              (RM)
            </div>
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="overallStatus-container">
              status:
              <div class="statusContainer">tidak lengkap</div>
            </div>
          </div>
        </div>
      </div>

      <!--JUN-->
      <div>
        <div class="monthName">Jun</div>
        <div class="monthlyDataInput-container">
          <!--bilangan hari-->
          <div class="monthlyDataInput-row rowPadding">
            Jumlah bilangan hari:
            <input type="number" class="customTextField" />
          </div>
          <!--faktor prorata-->
          <div class="monthlyDataInput-row rowPadding">
            Faktor Prorata:
            <input type="number" class="customTextField" />
          </div>
          <!--nilai semasa-->
          <div class="rowPadding">Nilai Penggunaan Air Semasa:</div>
          <div class="monthlyDataInput-row2">
            <div>
              <input type="number" class="customTextField2" />
              (kWh)
            </div>
            <div>
              <input type="number" class="customTextField2" />
              (RM)
            </div>
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="overallStatus-container">
              status:
              <div class="statusContainer">tidak lengkap</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br /><br />

    <!--BACK TO TOP -->
    <div class="toTopContainer">
      <div class="toTop"><a href="#top">Kembali ke atas</a></div>
    </div>

  </body>
</html>
