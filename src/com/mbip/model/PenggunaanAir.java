package com.mbip.model;

import java.io.Serializable;

public class PenggunaanAir implements Serializable {

    private static final long serialVersionUID = 1L;

    private int bil_hari;
    private float prorata;
    private float isipadu_air;
    private float harga_isipadu;
    private int bulan;
    private int tahun;
    private String fail_url;
    private Double pelepasan_karbon;

    private boolean is_complete;

    private int ID;
    private int akaun_id;

    public int getID() {
        return ID;
    }

    public void setID(int id) {
        ID = id;
    }

    public int getAkaun_id() {
        return akaun_id;
    }

    public void setAkaun_id(int akaun_id) {
        this.akaun_id = akaun_id;
    }

    public int getBil_hari() {
        return bil_hari;
    }

    public void setBil_hari(int bil_hari) {
        this.bil_hari = bil_hari;
    }

    public float getProrata() {
        return prorata;
    }

    public void setProrata(float prorata) {
        this.prorata = prorata;
    }

    public float getIsipadu_air() {
        return isipadu_air;
    }

    public void setIsipadu_air(float isipadu_air) {
        this.isipadu_air = isipadu_air;
    }

    public float getHarga_isipadu() {
        return harga_isipadu;
    }

    public void setHarga_isipadu(float harga_isipadu) {
        this.harga_isipadu = harga_isipadu;
    }

    public int getBulan() {
        return bulan;
    }

    public void setBulan(int bulan) {

        this.bulan = bulan;
    }

    public int getTahun() {
        return tahun;
    }

    public void setTahun(int tahun) {
        this.tahun = tahun;
    }

    public String getFail_url() {
        return fail_url;
    }

    public void setFail_url(String fail_url) {
        this.fail_url = fail_url;
    }

    public Double getPelepasan_karbon() {
        return pelepasan_karbon;
    }

    public void setPelepasan_karbon(Double pelepasan_karbon) {
        this.pelepasan_karbon = pelepasan_karbon;
    }

    public boolean getIs_complete() {
        return is_complete;
    }

    public void setIs_complete(boolean is_complete) {
        this.is_complete = is_complete;
    }

    public boolean isComplete() {
        if (bil_hari != 0 && prorata != 0 && isipadu_air != 0 && harga_isipadu != 0 && bulan != 0 && tahun != 0
                && fail_url != null && !fail_url.isEmpty() && pelepasan_karbon != null && ID != 0 && akaun_id != 0) {
            return true;
        } else {
            return false;
        }

    }
}
