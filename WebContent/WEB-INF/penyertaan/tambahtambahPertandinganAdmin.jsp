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


       <form action="/MBIP-Low-Carbon/penyertaan/admin/addpertandingan" method="POST">
            <div class="content" style="margin-bottom: 60px;">
                <h1>
                    Semak & Hantar Borang Pertandingan
                </h1>
                <div class="yellow-bar"></div>
            
            
                <div style="width: 100%; height: 100%; border: 1px #CFCFCF solid; margin-top: 40px;"></div>
                <div class="subtitle-start">
                    Pertandingan MBIP Rendah Karbon Baharu
                </div>
            
                <div class="profile-section">
                        <label class="label" for="fname">Nama Pertandingan MBIP Rendah Karbon:</label>
                        <input type="text" id="fname" name="name" value="${pertandingan.name}" style="height: 60px; width:80%"><br>
                        <div class="input-row" style="width:80%">
                            <div style="height: 80%; width: 100%; padding-right: 20px;">
                                <div>
                                    <label class="label" for="fname">Bulan Bermula:</label><br>
                                    <input type="number" min="1" max="12" id="fname" name="start_month" value="${pertandingan.start_month}"><br>
                                </div>
                            </div>
            
                            <div style="height: 80%; width: 100%; padding-left: 20px;">
                                <div>
                                    <label class="label" for="fname">Bulan Berakhir:</label><br>
                                    <input type="number" min="1" max="12" id="fname" name="end_month" value="${pertandingan.end_month}"><br>
                                </div>
                            </div>
                            <div style="height: 80%; width: 100%; padding-left: 20px;">
                                <div>
                                    <label class="label" for="fname">Tahun:</label><br>
                                    <input type="text" id="fname" name="tahun" value="${pertandingan.tahun}"><br>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="input-row" style="width:80%">
                            <div style="height: 100%; width: 100%; padding-right: 70px;">
                                <div>
                                    <label class="label" for="fname">Kategori Karbon:</label><br>
                                    <input type="text" id="fname" name="kategori" value="${pertandingan.kategori}"><br>
                                </div>
                            </div>
                            <div style="height: 100%; width: 100%; padding-left: 70px;">
                                <div>
                                    <label class="label" for="fname">Status Pertandingan:</label><br>
                                    <input type="text" id="fname" name="status"  value="${pertandingan.status}"><br>
                                </div>
                            </div>
                        </div>
            
                </div>
            
                <div class="centerElement">
                    <button class="submitForm">
                        <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                            Batal
                        </div>
                    </button>
                    <div class="spacer">
                    </div>
                    <button class="generateCertificate" type="submit">
                        <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word;">
                            Tambah
                        </div>
                    </button>
                    <div class="spacer">
                    </div>
                    <button class="padamBtn">
                        <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word;">
                            Padam
                        </div>
                    </button>
            
                </div>
            </div>
        </form>

    </body>
</html>

