<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/maklumatPeserta.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
    <link href='${pageContext.request.contextPath}/resources/css/https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    
</head>
<body>
    <!--TOPBAR-->
    <jsp:include page="/WEB-INF/components/header.jsp" />
    
    <!--MAKLUMAT PERIBADI-->
    <div class="centerDiv">
        <div class="mklmtPrbd-Container">
            <div class="pageTitle-container">
                <div class="toLeft">
                    <div class="pageTitle-stripe">
                        <h1>Maklumat Peserta</h1>
                    </div>
                </div>
            </div> 
            <div class="mklmtPrbd-header">Maklumat Peribadi</div>
            <div class="mklmtPrbd-data-container">
                <!--nama penuh-->
                <label>Nama Penuh:<br>
                    <input class="inputType1" type="text">
                </label>
    
                <!--email & ID peserta-->
                <div class="mklmtPrbd-row">
                    <label>Email:<br>
                        <input class="inputType2" type="text">
                    </label>
                    <label>ID Peserta:<br>
                        <input class="inputType2" type="text">
                    </label>
                </div>
                
                <!--no IC & no telefon-->
                <div class="mklmtPrbd-row">
                    <div>
                        <div class="label">Kawasan:</div>
                        <select class="js-example-basic-single input-select" name="kawasan_id">
                          <c:forEach items="${kawasans}" var="kawasan" varStatus="loop">
                            <option value="${kawasan.getKawasan_id()}" ${user.getAlamat().getKawasan_id() eq kawasan.getKawasan_id() ? 'selected' : ''}>${kawasan.getNAMA()}</option>
                          </c:forEach>
                        </select>
                      </div>
                </div>

                <!--no IC & no telefon-->
                <div class="mklmtPrbd-row">
                    <label>No. Kad Pengenalan:<br>
                        <input class="inputType3" type="number">
                    </label>
                    <label>No. Telefon:<br>
                        <input class="inputType3" type="number">
                    </label>
                </div>
                
                <!--institusi & status-->
                <div class="mklmtPrbd-row">
                    <label>Institusi (Tempat Bekerja):<br>
                        <select class="inputType4" name="course" required >
                            <option  disabled>Sila pilih jenis institusi anda:</option>
                            <option value="awam">Sektor Awam</option>
                            <option value="swasta">Sektor Swasta</option>
                            <option value="lain">Lain-lain</option>
                        </select>
                    </label>
                    <label>Status Pemohon:<br>
                        <select class="inputType4" name="course" required >
                            <option disabled>Sila pilih status anda:-</option>
                            <option value="bekerja">Bekerja</option>
                            <option value="pelajar">Pelajar</option>
                            <option value="suriRumah">Suri Rumah</option>
                            <option value="lain">Lain-lain</option>
                        </select>
                    </label>
                </div>
            </div>

            <!--simpan button-->
            <div class="simpanButton-container">
                <input class="simpanButton" type="submit" value="Simpan">
            </div>
        </div>
    </div>
    
    <br>

    <!--ALAMAT-->
    <div class="centerDiv">
        <div class="mklmtPrbd-Container">
            <div class="mklmtPrbd-header">Alamat</div>
            <div class="mklmtPrbd-subheader">
                Alamat dibawah merujuk kepada maklumat alamat rumah/institusi awam/syarikat swasta/<br>
                sekolah untuk didaftarkan dalam pertandingan ini dan alamat haruslah di dalam kawasan MBIP sahaja  
            </div>
            <div class="mklmtPrbd-data-container2">
                <!--nama penuh-->
                <label>Alamat:<br></label>
                    <textarea class="alamatInput" rows="4" cols="50">vv</textarea>
                
                
                <!--bandar & poskod-->
                <div class="mklmtPrbd-row">
                    <label>Bandar<br>
                        <select class="inputType4" name="course" required >
                            <option  disabled>Sila pilih bandar:-</option>
                            <option value="awam">Gelang Patah</option>
                            <option value="swasta">Iskandar Puteri</option>
                            <option value="lain">Kangkar Pulai</option>
                            <option value="lain">Lima Kedai</option>
                            <option value="lain">Skudai</option>
                            <option value="lain">Ulu Choh</option>
                        </select>
                    </label>
                    <label>Poskod<br>
                        <input class="inputType3" type="number">
                    </label>
                </div>

                <!--mesej-->
                <div class="errorMsg">
                    alamat diatas sudah didaftar dalam penyertaan lain!<br>
                    Sila gunakan alamat yang lain.
                </div>

                <!--kategori & bil isi rumah-->
                <div class="mklmtPrbd-row">
                    <label>Kategori<br>
                        <select class="inputType4" name="course" required >
                            <option disabled>Sila pilih kateogri:-</option>
                            <option value="A1">A1: Perumahan Bertingkat di MBIP (ie RIM, Kenari, dll)</option>
                            <option value="A2">A2: Perumahan Bertanah di MBIP</option>
                            <option value="B1">B1: Institusi di MBIP(2000 populasi)</option>
                            <option value="B2">B2: Institusi di MBIP (>2000 populasi)</option>
                            <option value="lain">Lain-lain</option>
                        </select>
                    </label>
                    <label>Bilangan isi rumah/institusi/sekolah<br>
                        <input class="inputType3" type="number">
                    </label>
                </div>


            </div>

            <!--simpan button-->
            <div class="simpanButton-container">
                <input class="simpanButton" type="submit" value="Simpan">
            </div>
        </div>
    </div>
    <br><br><br><br>
     
    <!--MENU-->
    <jsp:include page="/WEB-INF/components/menu.html"></jsp:include>         
</body>
</html>