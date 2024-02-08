package com.mbip.model;

import java.io.Serializable;

public class Kawasan implements Serializable {
    private int kawasan_id;
    private String NAMA, KATEGORI, STATUS, KETERANGAN, MUKIM, LUAS, DUN, PARLIMEN, BIL_RUMAH, BIL_PENDUDUK;

    public int getKawasan_id() {
        return kawasan_id;
    }
    public void setKawasan_id(int kawasan_id) {
        this.kawasan_id = kawasan_id;
    }
    public String getNAMA() {
        return NAMA;
    }
    public void setNAMA(String nAMA) {
        NAMA = nAMA;
    }
    public String getKATEGORI() {
        return KATEGORI;
    }
    public void setKATEGORI(String kATEGORI) {
        KATEGORI = kATEGORI;
    }
    public String getSTATUS() {
        return STATUS;
    }
    public void setSTATUS(String sTATUS) {
        STATUS = sTATUS;
    }
    public String getKETERANGAN() {
        return KETERANGAN;
    }
    public void setKETERANGAN(String kETERANGAN) {
        KETERANGAN = kETERANGAN;
    }
    public String getMUKIM() {
        return MUKIM;
    }
    public void setMUKIM(String mUKIM) {
        MUKIM = mUKIM;
    }
    public String getLUAS() {
        return LUAS;
    }
    public void setLUAS(String lUAS) {
        LUAS = lUAS;
    }
    public String getDUN() {
        return DUN;
    }
    public void setDUN(String dUN) {
        DUN = dUN;
    }
    public String getPARLIMEN() {
        return PARLIMEN;
    }
    public void setPARLIMEN(String pARLIMEN) {
        PARLIMEN = pARLIMEN;
    }
    public String getBIL_RUMAH() {
        return BIL_RUMAH;
    }
    public void setBIL_RUMAH(String bIL_RUMAH) {
        BIL_RUMAH = bIL_RUMAH;
    }
    public String getBIL_PENDUDUK() {
        return BIL_PENDUDUK;
    }
    public void setBIL_PENDUDUK(String bIL_PENDUDUK) {
        BIL_PENDUDUK = bIL_PENDUDUK;
    }
}
