package com.mbip.model;

import java.io.Serializable;

public class PenggunaanKitarSemula implements Serializable {
	private int ID, akaun_id, bulan, tahun;
	private float jisim_bahan, nilai_collect_point;
	private String fail_url;
	private double pelepasan_karbon;
	private boolean is_complete;

	public boolean getIs_complete() {
		return is_complete;

	}

	public void setIs_complete(Boolean is_complete) {
		if (is_complete == null)
			this.is_complete = false;
		else
			this.is_complete = is_complete;
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

	public float getJisim_bahan() {
		return jisim_bahan;
	}

	public void setJisim_bahan(Float jisim_bahan) {
		if (jisim_bahan == null)
			this.jisim_bahan = 0;
		else
			this.jisim_bahan = jisim_bahan;
	}

	public float getNilai_collect_point() {
		return nilai_collect_point;
	}

	public void setNilai_collect_point(Float nilai_collect_point) {
		if (nilai_collect_point == null)
			this.nilai_collect_point = 0;
		else
			this.nilai_collect_point = nilai_collect_point;
	}

	public String getFail_url() {
		return fail_url;
	}

	public void setFail_url(String fail_url) {
		this.fail_url = fail_url;
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

	public boolean isComplete() {
		if (ID != 0 && akaun_id != 0 && bulan != 0 && tahun != 0 && jisim_bahan != 0 && nilai_collect_point != 0
				&& pelepasan_karbon != 0 && fail_url != null) {
			return true;
		} else {
			return false;
		}
	}
}
