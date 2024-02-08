<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/penggunaanSemasa_kitarSemula.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Poppins"
      rel="stylesheet"
    />
    <title>Maklumat Bil Penggunaan Semasa - Kitar Semula</title>
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
      <div class="notSelected"><a href="penggunaanSemasa_air.jsp">Air</a></div>
      <div class="selected">Kitar Semula</div>
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
      <div class="guide-header">Pengumpulan Hasil Kitar Semula</div>
    </div>

    <!--MONTHLY DATA-->
    <div class="monthRow">
      <!--JANUARI-->
      <div>
        <div class="monthName">Januari</div>
        <div class="monthlyDataInput-container">
          <div class="rowPadding">Jumlah bahan kitar semula terkumpul:</div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (KG)
          </div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (RM atau Nilai Collect Point)
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="status2-container">
              status:
              <div class="theStatus2">tidak lengkap</div>
            </div>
          </div>
        </div>
      </div>

      <!--FEBRUARI-->
      <div>
        <div class="monthName">Februrari</div>
        <div class="monthlyDataInput-container">
          <div class="rowPadding">Jumlah bahan kitar semula terkumpul:</div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (KG)
          </div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (RM atau Nilai Collect Point)
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="status2-container">
              status:
              <div class="theStatus2">tidak lengkap</div>
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
          <div class="rowPadding">Jumlah bahan kitar semula terkumpul:</div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (KG)
          </div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (RM atau Nilai Collect Point)
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="status2-container">
              status:
              <div class="theStatus2">tidak lengkap</div>
            </div>
          </div>
        </div>
      </div>

      <!--APRIL-->
      <div>
        <div class="monthName">April</div>
        <div class="monthlyDataInput-container">
          <div class="rowPadding">Jumlah bahan kitar semula terkumpul:</div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (KG)
          </div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (RM atau Nilai Collect Point)
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="status2-container">
              status:
              <div class="theStatus2">tidak lengkap</div>
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
          <div class="rowPadding">Jumlah bahan kitar semula terkumpul:</div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (KG)
          </div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (RM atau Nilai Collect Point)
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="status2-container">
              status:
              <div class="theStatus2">tidak lengkap</div>
            </div>
          </div>
        </div>
      </div>

      <!--JUN-->
      <div>
        <div class="monthName">Jun</div>
        <div class="monthlyDataInput-container">
          <div class="rowPadding">Jumlah bahan kitar semula terkumpul:</div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (KG)
          </div>
          <!--KG-->
          <div class="monthlyDataInput-row rowPadding">
            <input type="number" class="customTextField" />
            (RM atau Nilai Collect Point)
          </div>
          <!--status pengisian-->
          <div class="spaceBetween">
            <input class="submitButton" type="submit" value="Simpan" />
            <div class="status2-container">
              status:
              <div class="theStatus2">tidak lengkap</div>
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

    <!--MENU-->
    <jsp:include page="/WEB-INF/components/menu.html"></jsp:include>
  </body>
</html>
