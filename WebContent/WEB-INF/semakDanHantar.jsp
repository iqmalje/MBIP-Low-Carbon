<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="review" content="width=device-width, initial-scale=1.0" />
    <title>Semak Dan Hantar</title>
    <link rel="stylesheet" href="css/semakDanHantar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css" />
  </head>
  <body>
    <jsp:include page="components/header.jsp"></jsp:include>
    <div class="content">
      <div class="toggle-button" id="toggle-button">
        <img
          id="toggle-img"
          class="toggle-img"
          src="images/malay-logo.png"
          alt="malay-logo"
          srcset=""
        />
      </div>
      <h1>Semak & Hantar Borang Pertandingan</h1>
      <div class="yellow-bar"></div>
      <div
        style="
          color: black;
          font-size: 14px;
          font-family: Poppins;
          font-weight: 400;
          word-wrap: break-word;
          padding: 20px 0px 50px 0px;
        "
      >
        Alamat dibawah merujuk kepada maklumat alamat rumah/institusi
        awam/syarikat swasta/<br />
        sekolah untuk didaftarkan dalam pertandingan ini dan alamat haruslah di
        dalam kawasan MBIP sahaja
      </div>
      <div style="width: 100%; height: 100%; border: 1px #cfcfcf solid"></div>
      <div class="subtitle">1. Maklumat Peserta</div>
      <div class="statusicon">
        <div class="statusicon2">
          <div
            style="
              width: 40px;
              height: 40px;
              background: #5dc55b;
              border-radius: 9999px;
            "
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="40"
              height="40"
              fill="white"
              class="bi bi-check2"
              viewbox="0 0 16 16"
            >
              <path
                d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"
              ></path>
            </svg>
          </div>
          <div
            style="
              text-align: center;
              color: black;
              font-size: 17px;
              font-family: Poppins;
              font-weight: 500;
              line-height: 20px;
              padding-top: 10px;
            "
          >
            maklumat<br />
            peribadi
          </div>
        </div>
        <div style="padding-left: 10px; padding-right: 10px">
          <div
            style="
              height: 3px;
              width: 80px;
              border: 2px #cfcfcf solid;
              border-radius: 3.5px;
              background-color: #cfcfcf;
            "
          ></div>
        </div>
        <div class="statusicon2">
          <div
            style="
              width: 40px;
              height: 40px;
              background: #ff0000;
              border-radius: 9999px;
            "
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="40"
              height="40"
              fill="white"
              class="bi bi-x"
              viewbox="0 0 16 16"
            >
              <path
                d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"
              ></path>
            </svg>
          </div>
          <div
            style="
              text-align: center;
              color: black;
              font-size: 17px;
              font-family: Poppins;
              font-weight: 500;
              line-height: 20px;
              padding-top: 10px;
            "
          >
            alamat
          </div>
        </div>
      </div>
      <div class="profile-header">
        <div class="input-row">
          <div class="input-row-withoutspace">
            <div
              style="
                color: black;
                font-size: 26px;
                font-family: Poppins;
                font-weight: 600;
                word-wrap: break-word;
                padding-right: 40px;
              "
            >
              Maklumat Peribadi
            </div>
            <div class="input-row-withoutspace">
              <div
                style="
                  color: black;
                  font-size: 12px;
                  font-family: Poppins;
                  font-style: italic;
                  font-weight: 500;
                  word-wrap: break-word;
                  padding-right: 15px;
                "
              >
                status:
              </div>
              <div
                style="
                  width: 130px;
                  height: 30px;
                  background: #5dc55b;
                  border-radius: 16px;
                "
              >
                <div class="substatus">lengkap</div>
              </div>
            </div>
          </div>
          <div
            style="
              width: 100px;
              height: 100%;
              border-radius: 9px;
              border: 1.3px #1931e3 solid;
              padding: 0px 15px 0px 15px;
            "
          >
            <div class="suntingButton">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                height="16"
                fill="#1931E3"
                class="bi bi-pencil-square"
                viewbox="0 0 16 16"
              >
                <path
                  d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"
                ></path>
                <path
                  fill-rule="evenodd"
                  d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"
                ></path>
              </svg>
              <div
                style="
                  color: #1931e3;
                  font-size: 17px;
                  font-family: Poppins;
                  font-weight: 500;
                  word-wrap: break-word;
                "
              >
                sunting
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="profile-section">
        <form class="input-form">
          <label class="label" for="fname">Nama Penuh:</label>
          <input type="text" id="fname" name="fname" /><br />
          <div class="input-row">
            <div style="height: 100%; width: 100%; padding-right: 70px">
              <div>
                <label class="label" for="fname">Email:</label><br />
                <input type="text" id="fname" name="fname" /><br />
              </div>
            </div>
            <div style="height: 100%; width: 100%; padding-left: 70px">
              <div>
                <label class="label" for="fname">ID Peserta:</label><br />
                <input type="text" id="fname" name="fname" /><br />
              </div>
            </div>
          </div>
          <br />
          <div class="input-row">
            <div style="height: 100%; width: 100%; padding-right: 70px">
              <div>
                <label class="label" for="fname"
                  >Institusi (Tempat Bekerja):</label
                ><br />
                <input type="text" id="fname" name="fname" /><br />
              </div>
            </div>
            <div style="height: 100%; width: 100%; padding-left: 70px">
              <div>
                <label class="label" for="fname">Status Pemohon:</label><br />
                <input type="text" id="fname" name="fname" /><br />
              </div>
            </div>
          </div>
        </form>
      </div>
      <div class="profile-header">
        <div class="input-row">
          <div class="input-row-withoutspace">
            <div
              style="
                color: black;
                font-size: 26px;
                font-family: Poppins;
                font-weight: 600;
                word-wrap: break-word;
                padding-right: 40px;
              "
            >
              Alamat
            </div>
            <div class="input-row-withoutspace">
              <div
                style="
                  color: black;
                  font-size: 12px;
                  font-family: Poppins;
                  font-style: italic;
                  font-weight: 500;
                  word-wrap: break-word;
                  padding-right: 15px;
                "
              >
                status:
              </div>
              <div
                style="
                  width: 130px;
                  height: 30px;
                  background: #ff0000;
                  border-radius: 16px;
                "
              >
                <div class="substatus">tidak lengkap</div>
              </div>
            </div>
          </div>
          <div
            style="
              width: 100px;
              height: 100%;
              border-radius: 9px;
              border: 1.3px #1931e3 solid;
              padding: 0px 15px 0px 15px;
            "
          >
            <div class="suntingButton">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                height="16"
                fill="#1931E3"
                class="bi bi-pencil-square"
                viewbox="0 0 16 16"
              >
                <path
                  d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"
                ></path>
                <path
                  fill-rule="evenodd"
                  d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"
                ></path>
              </svg>
              <div
                style="
                  color: #1931e3;
                  font-size: 17px;
                  font-family: Poppins;
                  font-weight: 500;
                  word-wrap: break-word;
                "
              >
                sunting
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="profile-section">
        <form class="input-form">
          <label class="label" for="fname">Alamat:</label>
          <input type="text" id="fname" name="fname" /><br />
          <div class="input-row">
            <div style="height: 100%; width: 100%; padding-right: 70px">
              <div>
                <label class="label" for="fname">Bandar:</label><br />
                <input type="text" id="fname" name="fname" /><br />
              </div>
            </div>
            <div style="height: 100%; width: 100%; padding-left: 70px">
              <div>
                <label class="label" for="fname">Poskod:</label><br />
                <input type="text" id="fname" name="fname" /><br />
              </div>
            </div>
          </div>
          <br />
          <div class="input-row">
            <div style="height: 100%; width: 100%; padding-right: 70px">
              <div>
                <label class="label" for="fname">Kategori:</label><br />
                <input type="text" id="fname" name="fname" /><br />
              </div>
            </div>
            <div style="height: 100%; width: 100%; padding-left: 70px">
              <div>
                <label class="label" for="fname"
                  >Bilangan isi rumah/institusi/sekolah:</label
                ><br />
                <input type="text" id="fname" name="fname" /><br />
              </div>
            </div>
          </div>
        </form>
      </div>
      <div class="subtitle">2. Rekod Penggunaan Semasa</div>
      <div class="statusicon">
        <div class="statusicon2">
          <div
            style="
              width: 40px;
              height: 40px;
              background: #5dc55b;
              border-radius: 9999px;
            "
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="40"
              height="40"
              fill="white"
              class="bi bi-check2"
              viewbox="0 0 16 16"
            >
              <path
                d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"
              ></path>
            </svg>
          </div>
          <div
            style="
              text-align: center;
              color: black;
              font-size: 17px;
              font-family: Poppins;
              font-weight: 500;
              line-height: 20px;
              padding-top: 10px;
            "
          >
            Air
          </div>
        </div>
        <div style="padding-left: 10px; padding-right: 10px">
          <div
            style="
              height: 3px;
              width: 80px;
              border: 2px #cfcfcf solid;
              border-radius: 3.5px;
              background-color: #cfcfcf;
            "
          ></div>
        </div>
        <div class="statusicon2">
          <div
            style="
              width: 40px;
              height: 40px;
              background: #ff0000;
              border-radius: 9999px;
            "
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="40"
              height="40"
              fill="white"
              class="bi bi-x"
              viewbox="0 0 16 16"
            >
              <path
                d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"
              ></path>
            </svg>
          </div>
          <div
            style="
              text-align: center;
              color: black;
              font-size: 17px;
              font-family: Poppins;
              font-weight: 500;
              line-height: 20px;
              padding-top: 10px;
            "
          >
            Elektrik
          </div>
        </div>
        <div style="padding-left: 10px; padding-right: 10px">
          <div
            style="
              height: 3px;
              width: 80px;
              border: 2px #cfcfcf solid;
              border-radius: 3.5px;
              background-color: #cfcfcf;
            "
          ></div>
        </div>
        <div class="statusicon2">
          <div
            style="
              width: 40px;
              height: 40px;
              background: #ff0000;
              border-radius: 9999px;
            "
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="40"
              height="40"
              fill="white"
              class="bi bi-x"
              viewbox="0 0 16 16"
            >
              <path
                d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"
              ></path>
            </svg>
          </div>
          <div
            style="
              text-align: center;
              color: black;
              font-size: 17px;
              font-family: Poppins;
              font-weight: 500;
              line-height: 20px;
              padding-top: 10px;
            "
          >
            Hasil Kitar<br />
            Semula
          </div>
        </div>
      </div>
      <div class="consumationRecord">
        <div class="consumationRecord-grid electric">
          <div
            style="
              color: black;
              font-size: 26px;
              font-family: Poppins;
              font-weight: 600;
              word-wrap: break-word;
              padding-top: 30px;
            "
          >
            Penggunaan Semasa Elektirk
          </div>
          <div class="recordcontent">
            <div class="input-row">
              <div
                style="
                  color: black;
                  font-size: 17px;
                  font-family: Poppins;
                  font-weight: 500;
                  padding-left: 35px;
                "
              >
                Maklumat<br />
                Penggunaan<br />
                Semasa
              </div>
              <div class="input-column">
                <div class="input-row-withoutspace">
                  <div
                    style="
                      color: black;
                      font-size: 12px;
                      font-family: Poppins;
                      font-style: italic;
                      font-weight: 500;
                      word-wrap: break-word;
                      padding-right: 15px;
                    "
                  >
                    status:
                  </div>
                  <div
                    style="
                      width: 130px;
                      height: 30px;
                      background: #5dc55b;
                      border-radius: 16px;
                    "
                  >
                    <div class="substatus">lengkap</div>
                  </div>
                </div>
                <div>
                  <div class="input-row" style="padding-top: 20px">
                    <div
                      style="
                        color: black;
                        font-size: 13px;
                        font-family: Poppins;
                        font-style: italic;
                        font-weight: 500;
                        text-decoration: underline;
                        cursor: pointer;
                      "
                    >
                      Lihat
                    </div>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-chevron-right"
                      viewbox="0 0 16 16"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"
                      ></path>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
            <div class="input-row" style="padding-top: 80px">
              <div
                style="
                  color: black;
                  font-size: 17px;
                  font-family: Poppins;
                  font-weight: 500;
                "
              >
                Salinan Bukti Bil<br />
                Penggunaan Semasa
              </div>
              <div class="input-column">
                <div class="input-row-withoutspace">
                  <div
                    style="
                      color: black;
                      font-size: 12px;
                      font-family: Poppins;
                      font-style: italic;
                      font-weight: 500;
                      word-wrap: break-word;
                      padding-right: 15px;
                    "
                  >
                    status:
                  </div>
                  <div
                    style="
                      width: 130px;
                      height: 30px;
                      background: #5dc55b;
                      border-radius: 16px;
                    "
                  >
                    <div class="substatus">lengkap</div>
                  </div>
                </div>
                <div>
                  <div class="input-row" style="padding-top: 20px">
                    <div
                      style="
                        color: black;
                        font-size: 13px;
                        font-family: Poppins;
                        font-style: italic;
                        font-weight: 500;
                        text-decoration: underline;
                        cursor: pointer;
                      "
                    >
                      Lihat
                    </div>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-chevron-right"
                      viewbox="0 0 16 16"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"
                      ></path>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="consumationRecord-grid electric">
          <div
            style="
              color: black;
              font-size: 26px;
              font-family: Poppins;
              font-weight: 600;
              word-wrap: break-word;
              padding-top: 30px;
            "
          >
            Penggunaan Semasa Air
          </div>
          <div class="recordcontent">
            <div class="input-row">
              <div
                style="
                  color: black;
                  font-size: 17px;
                  font-family: Poppins;
                  font-weight: 500;
                  padding-left: 35px;
                "
              >
                Maklumat<br />
                Penggunaan<br />
                Semasa
              </div>
              <div class="input-column">
                <div class="input-row-withoutspace">
                  <div
                    style="
                      color: black;
                      font-size: 12px;
                      font-family: Poppins;
                      font-style: italic;
                      font-weight: 500;
                      word-wrap: break-word;
                      padding-right: 15px;
                    "
                  >
                    status:
                  </div>
                  <div
                    style="
                      width: 130px;
                      height: 30px;
                      background: #5dc55b;
                      border-radius: 16px;
                    "
                  >
                    <div class="substatus">lengkap</div>
                  </div>
                </div>
                <div>
                  <div class="input-row" style="padding-top: 20px">
                    <div
                      style="
                        color: black;
                        font-size: 13px;
                        font-family: Poppins;
                        font-style: italic;
                        font-weight: 500;
                        text-decoration: underline;
                        cursor: pointer;
                      "
                    >
                      Lihat
                    </div>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-chevron-right"
                      viewbox="0 0 16 16"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"
                      ></path>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
            <div class="input-row" style="padding-top: 80px">
              <div
                style="
                  color: black;
                  font-size: 17px;
                  font-family: Poppins;
                  font-weight: 500;
                "
              >
                Salinan Bukti Bil<br />
                Penggunaan Semasa
              </div>
              <div class="input-column">
                <div class="input-row-withoutspace">
                  <div
                    style="
                      color: black;
                      font-size: 12px;
                      font-family: Poppins;
                      font-style: italic;
                      font-weight: 500;
                      word-wrap: break-word;
                      padding-right: 15px;
                    "
                  >
                    status:
                  </div>
                  <div
                    style="
                      width: 130px;
                      height: 30px;
                      background: #5dc55b;
                      border-radius: 16px;
                    "
                  >
                    <div class="substatus">lengkap</div>
                  </div>
                </div>
                <div>
                  <div class="input-row" style="padding-top: 20px">
                    <div
                      style="
                        color: black;
                        font-size: 13px;
                        font-family: Poppins;
                        font-style: italic;
                        font-weight: 500;
                        text-decoration: underline;
                        cursor: pointer;
                      "
                    >
                      Lihat
                    </div>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-chevron-right"
                      viewbox="0 0 16 16"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"
                      ></path>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="consumationRecord-grid electric">
          <div
            style="
              color: black;
              font-size: 26px;
              font-family: Poppins;
              font-weight: 600;
              word-wrap: break-word;
              padding-top: 30px;
            "
          >
            Aktiviti Kitar Semula
          </div>
          <div class="recordcontent">
            <div class="input-row">
              <div
                style="
                  color: black;
                  font-size: 17px;
                  font-family: Poppins;
                  font-weight: 500;
                  padding-left: 35px;
                "
              >
                Jumlah<br />
                Terkumpul (KG)
              </div>
              <div class="input-column">
                <div class="input-row-withoutspace">
                  <div
                    style="
                      color: black;
                      font-size: 12px;
                      font-family: Poppins;
                      font-style: italic;
                      font-weight: 500;
                      word-wrap: break-word;
                      padding-right: 15px;
                    "
                  >
                    status:
                  </div>
                  <div
                    style="
                      width: 130px;
                      height: 30px;
                      background: #5dc55b;
                      border-radius: 16px;
                    "
                  >
                    <div class="substatus">lengkap</div>
                  </div>
                </div>
                <div>
                  <div class="input-row" style="padding-top: 20px">
                    <div
                      style="
                        color: black;
                        font-size: 13px;
                        font-family: Poppins;
                        font-style: italic;
                        font-weight: 500;
                        text-decoration: underline;
                        cursor: pointer;
                      "
                    >
                      Lihat
                    </div>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-chevron-right"
                      viewbox="0 0 16 16"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"
                      ></path>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
            <div class="input-row" style="padding-top: 80px">
              <div
                style="
                  color: black;
                  font-size: 17px;
                  font-family: Poppins;
                  font-weight: 500;
                  padding-left: 15px;
                "
              >
                Jumlah Terkumpul<br />
                (RM atau Nilai<br />
                Collect Point)
              </div>
              <div class="input-column">
                <div class="input-row-withoutspace">
                  <div
                    style="
                      color: black;
                      font-size: 12px;
                      font-family: Poppins;
                      font-style: italic;
                      font-weight: 500;
                      word-wrap: break-word;
                      padding-right: 15px;
                    "
                  >
                    status:
                  </div>
                  <div
                    style="
                      width: 130px;
                      height: 30px;
                      background: #5dc55b;
                      border-radius: 16px;
                    "
                  >
                    <div class="substatus">lengkap</div>
                  </div>
                </div>
                <div>
                  <div class="input-row" style="padding-top: 20px">
                    <div
                      style="
                        color: black;
                        font-size: 13px;
                        font-family: Poppins;
                        font-style: italic;
                        font-weight: 500;
                        text-decoration: underline;
                        cursor: pointer;
                      "
                    >
                      Lihat
                    </div>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-chevron-right"
                      viewbox="0 0 16 16"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"
                      ></path>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="centerElement">
        <button class="submitForm">
          <div
            style="
              color: white;
              font-size: 17px;
              font-family: Poppins;
              font-weight: 500;
              word-wrap: break-word;
            "
          >
            Hantar Borang Penyertaan
          </div>
        </button>
        <div class="spacer"></div>
        <button class="generateCertificate">
          <div
            style="
              color: white;
              font-size: 17px;
              font-family: Poppins;
              font-weight: 500;
              word-wrap: break-word;
            "
          >
            Jana Sijil Penyertaan
          </div>
        </button>
      </div>
    </div>
    <div class="overlay-cancel" id="overlay-cancel">
      <div class="overlay-content">
        <div
          style="
            width: 80px;
            height: 80px;
            background: #ff0000;
            border-radius: 9999px;
            margin-top: 20px;
          "
        >
          <div class="centerElement" style="height: 100%">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="80"
              height="80"
              fill="white"
              class="bi bi-x"
              viewbox="0 0 16 16"
            >
              <path
                d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"
              ></path>
            </svg>
          </div>
        </div>
        <div
          style="
            text-align: center;
            color: black;
            font-size: 17px;
            font-family: Poppins;
            font-weight: 500;
            word-wrap: break-word;
          "
        >
          Maaf, Borang penyertaan tidak boleh dihantar.<br />
          Anda tidak menlengkapkan borang penyertaan sepenuhnya.
        </div>
        <button class="selesaiButton">
          <div
            style="
              color: white;
              font-size: 17px;
              font-family: Poppins;
              font-weight: 500;
              word-wrap: break-word;
            "
          >
            Selesai
          </div>
        </button>
      </div>
    </div>
    <div class="overlay-submit" id="overlay-submit">
      <div class="overlay-content">
        <img
          src="images/submitBorang.png"
          width="290"
          alt="submitBorang"
          srcset=""
        />
        <div
          style="
            text-align: center;
            color: black;
            font-size: 17px;
            font-family: Poppins;
            font-weight: 500;
            word-wrap: break-word;
          "
        >
          Anda pasti untuk menghantar borang penyertaan ini setelah menyemak
          borang?
        </div>
        <div class="centerElement">
          <button class="cancelButton">
            <div
              style="
                color: red;
                font-size: 17px;
                font-family: Poppins;
                font-weight: 500;
                word-wrap: break-word;
              "
            >
              Batal
            </div>
          </button>
          <div class="spacer"></div>
          <button class="hantarBorangButton">
            <div
              style="
                color: white;
                font-size: 17px;
                font-family: Poppins;
                font-weight: 500;
                word-wrap: break-word;
              "
            >
              Hantar Borang Pertandingan
            </div>
          </button>
        </div>
      </div>
    </div>
    <div class="overlay-done" id="overlay-done">
      <div class="overlay-content">
        <img src="images/doneIcon.png" width="290" alt="doneIcon" srcset="" />
        <div
          style="
            text-align: center;
            color: black;
            font-size: 17px;
            font-family: Poppins;
            font-weight: 500;
            word-wrap: break-word;
          "
        >
          Tahniah! Borang penyertann anda telah selesai dihantar.
        </div>
        <div class="centerElement">
          <button class="hantarBorangButton">
            <div
              style="
                color: white;
                font-size: 17px;
                font-family: Poppins;
                font-weight: 500;
                word-wrap: break-word;
              "
            >
              Selesai
            </div>
          </button>
        </div>
      </div>
    </div>
    <div class="overlay-email" id="overlay-email">
      <div class="overlay-content">
        <img src="images/emailIcon.png" width="290" alt="emailIcon" srcset="" />
        <div
          style="
            text-align: center;
            color: black;
            font-size: 17px;
            font-family: Poppins;
            font-weight: 500;
            word-wrap: break-word;
          "
        >
          Adakah ini alamat e-mel anda?<br />
          <br />
          haziffarhan@gmail.com
        </div>
        <div class="centerElement">
          <button class="cancelButton">
            <div
              style="
                color: red;
                font-size: 17px;
                font-family: Poppins;
                font-weight: 500;
                word-wrap: break-word;
              "
            >
              Sunting
            </div>
          </button>
          <div class="spacer"></div>
          <button class="hantarBorangButton">
            <div
              style="
                color: white;
                font-size: 17px;
                font-family: Poppins;
                font-weight: 500;
                word-wrap: break-word;
              "
            >
              Ya, ini adalah e-mel saya
            </div>
          </button>
        </div>
      </div>
    </div>
    <div class="overlay-done-email" id="overlay-done-email">
      <div class="overlay-content">
        <img src="images/doneIcon.png" width="290" alt="doneIcon" srcset="" />
        <div
          style="
            text-align: center;
            color: black;
            font-size: 17px;
            font-family: Poppins;
            font-weight: 500;
            word-wrap: break-word;
          "
        >
          Sijil penyertaan telah berjaya dihantar<br />
          Sila semak e-mail anda
        </div>
        <div class="centerElement">
          <button class="hantarBorangButton">
            <div
              style="
                color: white;
                font-size: 17px;
                font-family: Poppins;
                font-weight: 500;
                word-wrap: break-word;
              "
            >
              Selesai
            </div>
          </button>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/components/menu.html"></jsp:include>
  </body>
</html>
