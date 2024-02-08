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


        <c:if test="${notification != null}">
            <script>
                alert('${notification}');
            </script>
        </c:if>
        <div class="content">
            
            <h1>
                Semak & Hantar Borang Pertandingan
            </h1>
            <div class="yellow-bar"></div>
            
            <div style="color: black; font-size: 14px; font-family: Poppins; font-weight: 400; word-wrap: break-word;padding: 20px 0px 50px 0px;">
                Alamat dibawah merujuk kepada maklumat alamat rumah/institusi awam/syarikat swasta/<br/>
                sekolah untuk didaftarkan dalam pertandingan ini dan alamat haruslah di dalam kawasan MBIP sahaja  
            </div>
            
            <div style="width: 100%; height: 100%; border: 1px #CFCFCF solid;"></div>

            <div class="subtitle">
                1. Maklumat Peserta
            </div>
            
            <div class="statusicon">
                <div class="statusicon2">

                        <c:if test="${user.isComplete()}">
                           <div style="width: 40px; height: 40px; background: #5DC55B; border-radius: 9999px;">
                        
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2" viewBox="0 0 16 16">
                                    <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                                </svg>
                            </div>
                        </c:if>
                        <c:if test="${user.isComplete() == false}">
                           <div style="width: 40px; height: 40px; background: #FF0000; border-radius: 9999px;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-x" viewBox="0 0 16 16">
                                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                                </svg>
                            </div>
                        </c:if>
                        
                        
                        
                        
                    <div style="text-align: center; color: black; font-size: 17px; font-family: Poppins; font-weight: 500; line-height: 20px; padding-top: 10px;">
                        maklumat <br> peribadi
                    </div>
                </div>
                <div style="padding-left: 10px; padding-right: 10px;">
                    <div style="height: 3px;width: 80px; border: 2px #CFCFCF solid;border-radius: 3.50px; background-color: #CFCFCF;"></div>
                </div>
                <div class="statusicon2">
                    <c:if test="${user.alamat.isComplete()}">
                            <div style="width: 40px; height: 40px; background: #5DC55B; border-radius: 9999px;">
                        
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2" viewBox="0 0 16 16">
                                    <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                                </svg>
                            </div>
                        </c:if>
                        <c:if test="${user.alamat.isComplete() == false || user.alamat == null}">
                           <div style="width: 40px; height: 40px; background: #FF0000; border-radius: 9999px;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-x" viewBox="0 0 16 16">
                                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                                </svg>
                            </div>
                        </c:if>
                    <div style="text-align: center; color: black; font-size: 17px; font-family: Poppins; font-weight: 500; line-height: 20px; padding-top: 10px;">
                        alamat
                    </div>
                </div>
                
            </div>

            <div class="profile-header">
                <div class="input-row">
                    <div class="input-row-withoutspace">
                        <div style="color: black; font-size: 26px; font-family: Poppins; font-weight: 600; word-wrap: break-word; padding-right: 40px;">
                            Maklumat Peribadi
                        </div>
                        <div class="input-row-withoutspace">
                            <div style="color: black; font-size: 12px; font-family: Poppins; font-style: italic; font-weight: 500; word-wrap: break-word; padding-right: 15px;">
                                status:
                            </div>
                            <c:if test="${user.isComplete()}">
                                <div style="width: 130px; height: 30px; background: #5DC55B; border-radius: 16px;">
                                    <div class="substatus"> 
                                        lengkap
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${!user.isComplete()}">
                                <div style="width: 130px; height: 30px; background: #FF0000; border-radius: 16px;">
                                    <div class="substatus"> 
                                        tidak lengkap
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>    
                    <div style="width: 100px; height: 100%; border-radius: 9px; border: 1.30px #1931E3 solid; padding: 0px 15px 0px 15px;">
                        <div class="suntingButton" onclick="window.location = '/MBIP-Low-Carbon/auth/profile' ">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#1931E3" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                            </svg>
                            <div style="color: #1931E3; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                                sunting
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

            <div class="profile-section">
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
                </form>
            </div>

            <div class="profile-header">
                <div class="input-row">
                    <div class="input-row-withoutspace">
                        <div style="color: black; font-size: 26px; font-family: Poppins; font-weight: 600; word-wrap: break-word; padding-right: 40px;">
                            Alamat
                        </div>
                        <div class="input-row-withoutspace">
                            <div style="color: black; font-size: 12px; font-family: Poppins; font-style: italic; font-weight: 500; word-wrap: break-word; padding-right: 15px;">
                                status:
                            </div>
                            <c:if test="${user.alamat.isComplete()}">
                                <div style="width: 130px; height: 30px; background: #5DC55B; border-radius: 16px;">
                                    <div class="substatus"> 
                                        lengkap
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${!user.alamat.isComplete()}">
                                <div style="width: 130px; height: 30px; background: #FF0000; border-radius: 16px;">
                                    <div class="substatus"> 
                                        tidak lengkap
                                    </div>
                                </div>
                            </c:if>
                            
                        </div>
                    </div>    
                    <div style="width: 100px; height: 100%; border-radius: 9px; border: 1.30px #1931E3 solid; padding: 0px 15px 0px 15px;">
                        <div class="suntingButton" onclick="window.location = '/MBIP-Low-Carbon/auth/profile' ">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#1931E3" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                            </svg>
                            <div style="color: #1931E3; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                                sunting
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="profile-section">
                <form class="input-form">
                    <label class="label" for="fname">Alamat:</label>
                    <input type="text" id="fname" name="fname" value="${user.alamat.alamat}"><br>
                    <div class="input-row">
                        <div style="height: 100%; width: 100%; padding-right: 70px;">
                            <div>
                                <label class="label" for="fname">Bandar:</label><br>
                                <input type="text" id="fname" name="fname" value="${user.alamat.bandar}"><br>
                            </div>
                        </div>
                        <div style="height: 100%; width: 100%; padding-left: 70px;">
                            <div>
                                <label class="label" for="fname">Poskod:</label><br>
                                <input type="text" id="fname" name="fname" value="${user.alamat.poskod}"><br>
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
                2. Rekod Penggunaan Semasa
            </div>
            
            <div class="statusicon">
                <div class="statusicon2">
                    
                    <c:if test="${electricComplete == true}"> 
                        <div style="width: 40px; height: 40px; background: #5DC55B; border-radius: 9999px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2" viewBox="0 0 16 16">
                                <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                            </svg>
                        </div>
                    </c:if>
                    <c:if test="${electricComplete == false}"> 
                        <div style="width: 40px; height: 40px; background: #FF0000; border-radius: 9999px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-x" viewBox="0 0 16 16">
                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                            </svg>
                        </div>
                    </c:if>
                    
                    <div style="text-align: center; color: black; font-size: 17px; font-family: Poppins; font-weight: 500; line-height: 20px; padding-top: 10px;">
                        Elektrik
                    </div>
                </div>
                <div style="padding-left: 10px; padding-right: 10px;">
                    <div style="height: 3px;width: 80px; border: 2px #CFCFCF solid;border-radius: 3.50px; background-color: #CFCFCF;"></div>
                </div>
                <div class="statusicon2">
                    
                     <c:if test="${airComplete == true}"> 
                        <div style="width: 40px; height: 40px; background: #5DC55B; border-radius: 9999px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2" viewBox="0 0 16 16">
                                <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                            </svg>
                        </div>
                    </c:if>
                    <c:if test="${airComplete == false}"> 
                        <div style="width: 40px; height: 40px; background: #FF0000; border-radius: 9999px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-x" viewBox="0 0 16 16">
                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                            </svg>
                        </div>
                    </c:if>
                    <div style="text-align: center; color: black; font-size: 17px; font-family: Poppins; font-weight: 500; line-height: 20px; padding-top: 10px;">
                        Air
                    </div>
                </div>

                <div style="padding-left: 10px; padding-right: 10px;">
                    <div style="height: 3px;width: 80px; border: 2px #CFCFCF solid;border-radius: 3.50px; background-color: #CFCFCF;"></div>
                </div>
                <div class="statusicon2">
                    <c:if test="${electricComplete == true}"> 
                        <div style="width: 40px; height: 40px; background: #5DC55B; border-radius: 9999px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2" viewBox="0 0 16 16">
                                <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                            </svg>
                        </div>
                    </c:if>
                    <c:if test="${electricComplete == false}"> 
                        <div style="width: 40px; height: 40px; background: #FF0000; border-radius: 9999px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-x" viewBox="0 0 16 16">
                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                            </svg>
                        </div>
                    </c:if>
                    <div style="text-align: center; color: black; font-size: 17px; font-family: Poppins; font-weight: 500; line-height: 20px; padding-top: 10px;">
                        Hasil Kitar <br> Semula
                    </div>
                </div>
            </div>

            <div class="consumationRecord">
                <div class="consumationRecord-grid electric">
                    
                    <div class="recordcontent">
                        <div style="color: black; font-size: 26px; font-family: Poppins; font-weight: 600; word-wrap: break-word; padding-bottom: 20px;">
                            Penggunaan Semasa Elektrik
                        </div>
                        <div class="table-con">
                            <table>
                                <tr>
                                    <th>Bulan</th>
                                    <th>Status</th>
                                    <th>Paparan Penuh</th>
                                </tr>
                                <c:forEach begin="${start_month}" end="${end_month}" varStatus="loop">
                                    <tr>
                                        <td>${bulans[loop.index - 1]}</td>
                                        <td>
                                            <div class="centerElement">
                                                <div style="width: 130px; height: 30px; background: ${(elektrikList[loop.index - start_month].isComplete()) ? '#5DC55B' : '#FF0000'}; border-radius: 16px;">
                                                    <div class="substatus">
                                                        ${(elektrikList[loop.index - start_month].isComplete()) ? 'Lengkap' : 'Tidak Lengkap'}
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="buka">
                                                <u><a href="/MBIP-Low-Carbon/penggunaanElektrik/insertElektrik_nilai?tahun=${tahun}&bulan=${loop.index}&kategori=elektrik">Buka</a></u>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                                
                                
                            </table>
                        </div>
                    </div>
                </div>
    
                <div class="consumationRecord-grid electric">
                    
                    <div class="recordcontent">
                        <div style="color: black; font-size: 26px; font-family: Poppins; font-weight: 600; word-wrap: break-word; padding-bottom: 20px;">
                            Penggunaan Semasa Air
                        </div>
                        <div class="table-con">
                            <table>
                                <tr>
                                    <th>Bulan</th>
                                    <th>Status</th>
                                    <th>Paparan Penuh</th>
                                </tr>
                                <c:forEach begin="${start_month}" end="${end_month}" varStatus="loop">
                                    <tr>
                                        <td>${bulans[loop.index - 1]}</td>
                                        <td>
                                            <div class="centerElement">
                                                <div style="width: 130px; height: 30px; background: ${(airList[loop.index-start_month].isComplete()) ? '#5DC55B' : '#FF0000'}; border-radius: 16px;">
                                                    <div class="substatus">
                                                        ${(airList[loop.index-start_month].isComplete()) ? 'Lengkap' : 'Tidak Lengkap'}
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="buka">
                                                <u><a href="/MBIP-Low-Carbon/penggunaanAir/insertAir_nilai?tahun=${tahun}&bulan=${loop.index}&kategori=air">Buka</a></u>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
    
                <div class="consumationRecord-grid electric">
                    
                    <div class="recordcontent">
                        <div style="color: black; font-size: 26px; font-family: Poppins; font-weight: 600; word-wrap: break-word; padding-bottom: 20px;">
                            Aktiviti Kitar Semula
                        </div>
                        <div class="table-con">
                            <table>
                                <tr>
                                    <th>Bulan</th>
                                    <th>Status</th>
                                    <th>Paparan Penuh</th>
                                </tr>
                                <c:forEach begin="${start_month}" end="${end_month}" varStatus="loop">
                                    <tr>
                                        <td>${bulans[loop.index - 1]}</td>
                                        <td>
                                            <div class="centerElement">
                                                <div style="width: 130px; height: 30px; background: ${(kitarSemulaList[loop.index-start_month].isComplete()) ? '#5DC55B' : '#FF0000'}; border-radius: 16px;">
                                                    <div class="substatus">
                                                        ${(kitarSemulaList[loop.index-start_month].isComplete()) ? 'Lengkap' : 'Tidak Lengkap'}
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="buka">
                                                <u><a href="/MBIP-Low-Carbon/penggunaanElektrik/insertKitarSemula_nilai?tahun=${tahun}&bulan=${loop.index}&kategori=kitarsemula">Buka</a></u>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>   
                
            </div>
            
            <div class="centerElement">
                <button class="submitForm" onclick="window.location = '/MBIP-Low-Carbon/penyertaan/hantarpenyertaan/${pertandingan_id}'">
                    <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                        Hantar Borang Penyertaan
                    </div>
                </button>

            </div>
        </div>

        <div class="overlay-cancel" id="overlay-cancel">
            <div class="overlay-content">
                <div style="width: 80px; height: 80px; background: #FF0000; border-radius: 9999px; margin-top: 20px;">
                    <div class="centerElement" style="height: 100%;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="white" class="bi bi-x" viewBox="0 0 16 16">
                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                        </svg>
                    </div>
                </div>
                <div style="text-align: center; color: black; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                    Maaf, Borang penyertaan tidak boleh dihantar.<br/>
                    Anda tidak menlengkapkan borang penyertaan sepenuhnya.
                </div>
                <button class="selesaiButton">
                    <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word;">
                        Selesai
                    </div>
                </button>
            </div>
        </div>

        <div class="overlay-submit" id="overlay-submit">
            <div class="overlay-content">
                <img src="images/submitBorang.png" width="290" alt="" srcset="" />
                <div style="text-align: center; color: black; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                    Anda pasti untuk menghantar borang penyertaan ini setelah menyemak borang?
                </div>
                <div class="centerElement">
                    <button class="cancelButton">
                        <div style="color: red; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word;">
                            Batal
                        </div>
                    </button>
                    <div class="spacer"></div>
                    <button class="hantarBorangButton">
                        <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                            Hantar Borang Pertandingan
                        </div>
                    </button>
                </div>
            </div>
        </div>
        
        <div class="overlay-done" id="overlay-done">
            <div class="overlay-content">
                <img src="images/doneIcon.png" width="290" alt="" srcset="" />
                <div style="text-align: center; color: black; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                    Tahniah! Borang  penyertann anda telah selesai dihantar.
                </div>
                <div class="centerElement">
                    <button class="hantarBorangButton">
                        <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                            Selesai
                        </div>
                    </button>
                </div>
            </div>
        </div>

        <div class="overlay-email" id="overlay-email">
            <div class="overlay-content">
                <img src="images/emailIcon.png" width="290" alt="" srcset="" />
                <div style="text-align: center; color: black; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                    Adakah ini alamat e-mel anda? </br> </br>
                    haziffarhan@gmail.com
                </div>
                <div class="centerElement">
                    <button class="cancelButton">
                        <div style="color: red; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word;">
                            Sunting
                        </div>
                    </button>
                    <div class="spacer"></div>
                    <button class="hantarBorangButton">
                        <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                            Ya, ini adalah e-mel saya
                        </div>
                    </button>
                </div>
            </div>
        </div>

        <div class="overlay-done-email" id="overlay-done-email">
            <div class="overlay-content">
                <img src="images/doneIcon.png" width="290" alt="" srcset="" />
                <div style="text-align: center; color: black; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                    Sijil penyertaan telah berjaya dihantar </br>
                    Sila semak e-mail anda
                </div>
                <div class="centerElement">
                    <button class="hantarBorangButton">
                        <div style="color: white; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
                            Selesai
                        </div>
                    </button>
                </div>
            </div>
        </div>
    </body>
</html>

