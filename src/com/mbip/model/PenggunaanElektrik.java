package com.mbip.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class PenggunaanElektrik implements Serializable {

    private static final long serialVersionUID = 1L;

    private int bil_hari;
    private float prorata;
    private float tenaga_elektrik;
    private float harga_elektrik;
    private int bulan;
    private int tahun;
    private String fail_url;
    private double pelepasan_karbon;

    private boolean is_complete;

    private MultipartFile salinanBil;

    private int ID;
    private int akaun_id;

    public MultipartFile getSalinanBil() {
        return salinanBil;
    }

    public void setSalinanBil(MultipartFile salinFile) {
        this.salinanBil = salinFile;
    }

    public int getID() {
        return ID;
    }

    public void setID(int iD) {
        ID = iD;
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

    public void setBil_hari(Integer bil_hari) {
        if (bil_hari == null)
            this.bil_hari = 0;
        else
            this.bil_hari = bil_hari;
    }

    public float getProrata() {
        return prorata;
    }

    public void setProrata(Float prorata) {
        if (prorata == null)
            this.prorata = 0;
        else
            this.prorata = prorata;
    }

    public float getTenaga_elektrik() {
        return tenaga_elektrik;
    }

    public void setTenaga_elektrik(Float tenaga_elektrik) {
        if (tenaga_elektrik == null)
            this.tenaga_elektrik = 0;
        else
            this.tenaga_elektrik = tenaga_elektrik;
    }

    public float getHarga_elektrik() {
        return harga_elektrik;
    }

    public void setHarga_elektrik(Float harga_elektrik) {
        if (harga_elektrik == null)
            this.harga_elektrik = 0;
        else
            this.harga_elektrik = harga_elektrik;
    }

    public double getPelepasan_karbon() {
        return pelepasan_karbon;
    }

    public void setPelepasan_karbon(Double pelepasan_karbon) {
        if (pelepasan_karbon == null)
            this.pelepasan_karbon = 0;
        else
            this.pelepasan_karbon = pelepasan_karbon;
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

    public boolean getIs_complete() {
        return is_complete;
    }

    public void setIs_complete(boolean is_complete) {
        this.is_complete = is_complete;
    }

    public boolean isComplete() {
        if (bil_hari != 0 && prorata != 0 && tenaga_elektrik != 0 && harga_elektrik != 0 && bulan != 0 && tahun != 0
                && fail_url != null && !fail_url.isEmpty() && pelepasan_karbon != 0) {
            return true;
        } else {
            return false;
        }

    }
}
