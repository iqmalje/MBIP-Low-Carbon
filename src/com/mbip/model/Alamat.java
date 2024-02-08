package com.mbip.model;

public class Alamat {
    private int akaun_id, kawasan_id, poskod, bilangan_isi_rumah;
    private String alamat, bandar, kategori;

    public int getKawasan_id() {
        return kawasan_id;
    }

    public void setKawasan_id(int kawasan_id) {
        this.kawasan_id = kawasan_id;
    }

    public int getAkaun_id() {
        return akaun_id;
    }

    public void setAkaun_id(int akaun_id) {
        this.akaun_id = akaun_id;
    }

    public int getPoskod() {
        return poskod;
    }

    public void setPoskod(int poskod) {
        this.poskod = poskod;
    }

    public int getBilangan_isi_rumah() {
        return bilangan_isi_rumah;
    }

    public void setBilangan_isi_rumah(int bilangan_isi_rumah) {
        this.bilangan_isi_rumah = bilangan_isi_rumah;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getBandar() {
        return bandar;
    }

    public void setBandar(String bandar) {
        this.bandar = bandar;
    }

    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public boolean isComplete() {
        if (akaun_id != 0 && kawasan_id != 0 && poskod != 0 && bilangan_isi_rumah != 0 && alamat != null
                && bandar != null && kategori != null)
            return true;
        else
            return false;
    }

}
