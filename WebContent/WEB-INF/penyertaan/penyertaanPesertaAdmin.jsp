<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<c:set var="bulans" value="${['Januari', 'Februari', 'March', 'April', 'May', 'Jun', 'Julai', 'Ogos', 'September', 'Oktober', 'November', 'Disember']}" scope="page" />

    <head>
        <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/penyertaanPeserta.css'>
    </head>
    <body>
        <jsp:include page="/WEB-INF/components/header.jsp" />


        <div class="content">
            
            <h1>
                Pengurusan Data Karbon Peserta
            </h1>
            <div class="yellow-bar"></div>
            
            <div style="color: black; font-size: 14px; font-family: Poppins; font-weight: 400; word-wrap: break-word;padding: 20px 0px 50px 0px;">
                Kakitangan MBIP boleh menggunakan halaman ini untuk mengira data penggunaan peserta, mengemas kini <br>
                peta penggunaan karbon dan memuat turun bil penggunaan perserta.  
            </div>
            
            <div style="width: 100%; height: 100%; border: 1px #CFCFCF solid;"></div>

            <div class="header2-container">
                <div class="header2">Senarai Peserta</div>
                <div class="returnPage-container">
                    <img src="${pageContext.request.contextPath}/resources/images/previous icon.png" alt="">
                    <a href="pengurusanData_RingkasanBandar.html" style="padding-left: 10px;">Kembali ke Senarai Peserta</a>
                </div>
            </div>

            <div class="profile-header">
                <div class="input-row">
                    <div class="input-row-withoutspace">
                        <div style="color: black; font-size: 26px; font-family: Poppins; font-weight: 600; word-wrap: break-word; padding-right: 40px;">
                            Maklumat Peserta
                        </div>
                        
                    </div>    
                    
                </div>
            </div>
            

            <div class="profile-sectionAdmin">
                <form class="input-form">
                    <label class="label" for="fname">Nama Penuh:</label>
                    <input type="text" id="fname" name="fname" value="${user.namaPenuh}"><br>
                    <div class="input-row">
                        <div style="height: 100%; width: 100%; padding-right: 70px;">
                            <div>
                                <label class="label" for="fname">Email:</label><br>
                                <input type="text" id="fname" name="fname" value="${user.email}"><br>
                            </div>
                        </div>
                        <div style="height: 100%; width: 100%; padding-left: 70px;">
                            <div>
                                <label class="label" for="fname">ID Peserta:</label><br>
                                <input type="text" id="fname" name="fname" value="${user.akaun_id}"><br>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="input-row">
                        <div style="height: 100%; width: 100%; padding-right: 70px;">
                            <div>
                                <label class="label" for="fname">Institusi (Tempat Bekerja):</label><br>
                                <input type="text" id="fname" name="fname" value="${user.institusi}"><br>
                            </div>
                        </div>
                        <div style="height: 100%; width: 100%; padding-left: 70px;">
                            <div>
                                <label class="label" for="fname">Status Pemohon:</label><br>
                                <input type="text" id="fname" name="fname" value="${user.status}"><br>
                            </div>
                        </div>
                    </div>
                    <label class="label" for="fname">Alamat:</label>
                    <input type="text" id="fname" name="fname" value="${user.alamat.alamat}" style="height: 60px;"><br>
                    <div class="input-row">
                        <div style="height: 100%; width: 100%; padding-right: 70px;">
                            <div>
                                <label class="label" for="fname">Bandar:</label><br>
                                <input type="text" id="fname" name="fname" value="${user.alamat.bandar}"><br>
                            </div>
                        </div>
                        <div style="height: 100%; width: 100%;">
                            <div>
                                <label class="label" for="fname">Poskod:</label><br>
                                <input type="text" id="fname" name="fname" value="${user.alamat.poskod}"><br>
                            </div>
                        </div>

                        <div style="height: 100%; width: 100%; padding-left: 70px;">
                            <div>
                                <label class="label" for="fname">Kawasan:</label><br>
                                <input type="text" id="fname" name="fname" value="${user.alamat.bandar}"><br>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="input-row">
                        <div style="height: 100%; width: 100%; padding-right: 70px;">
                            <div>
                                <label class="label" for="fname">Kategori:</label><br>
                                <input type="text" id="fname" name="fname" value="${user.alamat.kategori}"><br>
                            </div>
                        </div>
                        <div style="height: 100%; width: 100%; padding-left: 70px;">
                            <div>
                                <label class="label" for="fname">Bilangan isi rumah/institusi/sekolah:</label><br>
                                <input type="text" id="fname" name="fname"  value="${user.alamat.bilangan_isi_rumah}"><br>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="subtitle">
                Rekod Penggunaan Semasa
            </div>
            
            <div class="table-con" style=" margin-bottom:50px">
                <table style="width:100%;">
                  <tr>
                    <th style="width: 40px;">Bil</th>
                    <th style="width: 160px;">Bulan</th>
                    <th style="width: 160px;">Status</th>
                    <th style="width: 160px;">Pelepasan Karbon</th>
                    <th style="width: 100px;">Paparan Penuh</th>
                  </tr>
                  <c:forEach items="${items}" var="air" varStatus="loop">
                    <tr>
                      <!-- <td>${loop.index + 1}</td>
                      <td>${bulan[loop.index]}</td>
                      <td>${(air.getFail_url() != null && air.getBil_hari() != 0) ? 'Lengkap' : 'Tidak Lengkap'}</td>
                      <td>Tiada Rekod</td>
                      <td><a href="/MBIP-Low-Carbon/${controller}/${method}?bulan=${loop.index+1}&tahun=${tahun}&kategori=${kategori}">
                            Buka
                          </a>
                      </td> -->
                    </tr>
                  </c:forEach>
                  
                </table>
              </div>

            
            
            <div class="centerElement">
                <button class="submitFormTolakPenyertaan">
                    <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                        Tolak Penyertaan
                    </div>
                </button>

                <div class="spacer">
                </div>

                <button class="generateCertificate">
                    <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word;">
                        Terima Penyertaan
                    </div>
                </button>
            </div>
        </div>

        
    </body>
</html>

