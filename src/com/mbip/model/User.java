package com.mbip.model;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	private int akaun_id;
	private String email, password, namaPenuh, IC_no, nombor_telefon, institusi, status;

	private Alamat alamat;

	private boolean is_admin;

	public void setAkaun_id(int akaun_id) {
		this.akaun_id = akaun_id;
	}

	public int getAkaun_id() {
		return akaun_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNamaPenuh() {
		return namaPenuh;
	}

	public void setNamaPenuh(String namaPenuh) {
		this.namaPenuh = namaPenuh;
	}

	public String getICNo() {
		return IC_no;
	}

	public void setIC_no(String IC_no) {
		this.IC_no = IC_no;
	}

	public String getNomborTelefon() {
		return nombor_telefon;
	}

	public void setnombor_telefon(String nombor_telefon) {
		this.nombor_telefon = nombor_telefon;
	}

	public String getInstitusi() {
		return institusi;
	}

	public void setInstitusi(String institusi) {
		this.institusi = institusi;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean getIsAdmin() {
		return is_admin;
	}

	public void setIsAdmin(boolean is_admin) {
		this.is_admin = is_admin;
	}

	public void setAlamat(Alamat alamat) {
		this.alamat = alamat;
	}

	public Alamat getAlamat() {
		return alamat;
	}

	public boolean isComplete() {
		if (email != null && password != null && namaPenuh != null && IC_no != null && nombor_telefon != null
				&& institusi != null && status != null && akaun_id != 0)
			return true;
		else
			return false;
	}

}
