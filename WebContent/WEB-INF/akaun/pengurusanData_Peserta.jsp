<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/pengurusanData_Peserta.css'>
    </head>
    <body>
        <jsp:include page="/WEB-INF/components/header.jsp" />
<c:set var="bulans" value="${['Januari', 'Februari', 'March', 'April', 'May', 'Jun', 'Julai', 'Ogos', 'September', 'Oktober', 'November', 'Disember']}" scope="page" />


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
                    <a href="/MBIP-Low-Carbon/auth/admin/dashboard" style="padding-left: 10px;">Kembali ke Paparan Kawasan</a>
                </div>
            </div>

            <div class="subtitle">
                1. Maklumat Peserta
            </div>
            <div class="profile-header">
                <div class="input-row">
                    <div class="input-row-withoutspace">
                        <div style="color: black; font-size: 20px; font-family: Poppins; font-weight: 600; word-wrap: break-word; padding-right: 40px;">
                            Maklumat Peribadi
                        </div>
                        
                    </div>    
                    
                </div>
            </div>
            

            <div class="profile-section">
                <form class="input-form">
                    <label class="label" for="fname">Nama Penuh:</label>
                    <input type="text" id="fname" name="fname" value="${targetuser.getNamaPenuh()}"/><br>
                    <div class="input-row">
                        <div style="height: 100%; width: 100%; padding-right: 70px;">
                            <div>
                                <label class="label" for="fname">Email:</label><br>
                                <input type="text" id="fname" name="fname" value="${targetuser.getEmail()}"><br>
                            </div>
                        </div>
                        <div style="height: 100%; width: 100%; padding-left: 70px;">
                            <div>
                                <label class="label" for="fname">ID Peserta:</label><br>
                                <input type="text" id="fname" name="fname" value="${targetuser.getAkaun_id()}"><br>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="input-row">
                        <div style="height: 100%; width: 100%; padding-right: 70px;">
                            <div>
                                <label class="label" for="fname">Institusi (Tempat Bekerja):</label><br>
                                <input type="text" id="fname" name="fname" value="${targetuser.getInstitusi()}"><br>
                            </div>
                        </div>
                        <div style="height: 100%; width: 100%; padding-left: 70px;">
                            <div>
                                <label class="label" for="fname">Status Pemohon:</label><br>
                                <input type="text" id="fname" name="fname" value="${targetuser.getStatus()}" /><br>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="profile-header">
                <div class="input-row">
                    <div class="input-row-withoutspace">
                        <div style="color: black; font-size: 20px; font-family: Poppins; font-weight: 600; word-wrap: break-word; padding-right: 40px; margin-top: 60px;">
                            Alamat
                        </div>
                    </div>    
                    
                </div>
            </div>

            <div class="profile-section">
                <form class="input-form">
                    <label class="label" for="fname">Alamat:</label>
                    <input type="text" id="fname" name="fname" value="${targetuser.getAlamat().getAlamat()}" /><br>
                    <div class="input-row">
                        <div style="height: 100%; width: 100%; padding-right: 70px;">
                            <div>
                                <label class="label" for="fname">Bandar:</label><br>
                                <input type="text" id="fname" name="fname" value="${targetuser.getAlamat().getBandar()}" /><br>
                            </div>
                        </div>
                        <div style="height: 100%; width: 500px;">
                            <div>
                                <label class="label" for="fname">Poskod:</label><br>
                                <input type="text" id="fname" name="fname" value="${targetuser.getAlamat().getPoskod()}" /><br>
                            </div>
                        </div>
                        <div style="height: 100%; width: 100%; padding-left: 70px;">
                            <div>
                                <label class="label" for="fname">Kawasan:</label><br>
                                <input type="text" id="fname" name="fname" value="${kawasan.getNAMA()}"><br>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="input-row">
                        <div style="height: 100%; width: 350px; padding-right: 70px;">
                            <div>
                                <label class="label" for="fname">Kategori:</label><br>
                                <input type="text" id="fname" name="fname" value="${targetuser.getAlamat().getKategori()}" /><br>
                            </div>
                        </div>
                        <div style="height: 100%; width: 350px; padding-left: 70px;">
                            <div>
                                <label class="label" for="fname">Bilangan isi rumah/institusi/sekolah:</label><br>
                                <input type="text" id="fname" name="fname" value="${targetuser.getAlamat().getBilangan_isi_rumah()}" /><br>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="subtitle">
                2. Rekod Penggunaan Semasa
            </div>
            
            <form class="formAlign">
                <div class="tahun-kategori-cari-con ">
                  
                      <select class="pilih-con" name="tahun">
                        <option class="grey-text" value="" disabled >Pilih Tahun</option>
                        <option value="2021" ${tahun eq '2021' ? 'selected' : ''} >2021</option>
                        <option value="2022" ${tahun eq '2022' ? 'selected' : ''} >2022</option>
                        <option value="2023" ${tahun eq '2023' ? 'selected' : ''} >2023</option>
                        <option value="2024" ${tahun eq '2024' ? 'selected' : ''} >2024</option>
                      </select>
                  
                
                    <select class="pilih-con" style="width: 200px;" name="kategori">
                      <option class="grey-text" value="" disabled >Pilih Kategori Karbon</option>
                      <option value="air" ${kategori eq 'air' ? 'selected' : ''}>Air</option>
                      <option value="elektrik" ${kategori eq 'elektrik' ? 'selected' : ''}>Elektrik</option>
                      <option value="kitarsemula" ${kategori eq 'kitarsemula' ? 'selected' : ''}>Kitar Semula</option>
                    </select>
                  
                  <button type="submit" style="width: 100px;">Cari</button>  
                </div>
            </form>

            <div class="center">
                <div class="profile-section" style="width: 60%; padding-left: 40px; padding-right: 40px; margin-left: 50px; margin-right: 50px;">
                    <table>
                        <tr>
                            <th style="width: 50px;">Bil.</th>
                            <th style="width: 300px;">Bulan</th>
                            <th style="width: 200px;">Status</th>
                            <th style="width: 350px;">Pelepasan Karbon</th>
                            <th style="width: 150px;">Lihat Penuh</th>
                        </tr>
                        <c:forEach begin="1" end="7" varStatus="loop">
                            <tr>
                                <td style="width: 50px;">${loop.index}</td>
                                <td style="width: 300px;">${bulans[loop.index - 1]}</td>
                                <td style="width: 200px; display: flex; flex-direction: row; justify-content: center;">
                                    <div class="status2-container">
                                        <div class="theStatus2" style="background-color: ${(items.get(loop.index-1).isComplete()) ? 'green' : 'red'}">${(items.get(loop.index-1).isComplete()) ? 'Lengkap' : 'Tidak Lengkap'}</div>
                                    </div>
                                </td>
                                <td style="width: 350px;">${items.get(loop.index-1).getPelepasan_karbon() > 0 ? items.get(loop.index-1).getPelepasan_karbon() : 'Tiada rekod'}</td>
                                <td style="width: 150px;">
                                    <div class="buka">
                                        <a href="/MBIP-Low-Carbon/${controllername}/view/${targetuser.akaun_id}/${loop.index}/${tahun}">Buka</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        
                    </table>
                </div>
            </div>

            
            
            <div class="centerElement">
                <button class="submitForm">
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

