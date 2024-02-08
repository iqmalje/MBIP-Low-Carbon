package com.mbip.model;

import java.io.Serializable;

public class Penyertaan implements Serializable {
	private int penyertaan_id, pertandingan_id, akaun_id;
	private String status;
	private Pertandingan pertandingan;

	public Pertandingan getPertandingan() {
		return pertandingan;
	}

	public void setPertandingan(Pertandingan pertandingan) {
		this.pertandingan = pertandingan;
	}

	public int getPenyertaan_id() {
		return penyertaan_id;
	}

	public void setPenyertaan_id(int penyertaan_id) {
		this.penyertaan_id = penyertaan_id;
	}

	public int getPertandingan_id() {
		return pertandingan_id;
	}

	public void setPertandingan_id(int pertandingan_id) {
		this.pertandingan_id = pertandingan_id;
	}

	public int getAkaun_id() {
		return akaun_id;
	}

	public void setAkaun_id(int akaun_id) {
		this.akaun_id = akaun_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
