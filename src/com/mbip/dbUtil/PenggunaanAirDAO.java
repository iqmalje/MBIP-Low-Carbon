package com.mbip.dbUtil;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.mbip.model.PenggunaanAir;
import com.mbip.model.PenggunaanElektrik;

public class PenggunaanAirDAO {

	@SuppressWarnings("null")
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public List<PenggunaanAir> getUserPenggunaanAirOverview(int akaunid, int tahun) {

		String sql = "SELECT * FROM penggunaan_air WHERE akaun_id=? AND tahun=?";
		Object args[] = { akaunid, tahun };
		List<PenggunaanAir> penggunaanAirs = jdbct.query(sql,
				new BeanPropertyRowMapper<PenggunaanAir>(PenggunaanAir.class), args);
		/*
		 * Since we will use 12 months in the dashboard regardless, thus we just prepare
		 * an ArrayList of 12
		 */

		List<PenggunaanAir> returnList = new ArrayList<PenggunaanAir>();

		for (int i = 0; i < 12; i++) {
			returnList.add(new PenggunaanAir());
		}
		for (PenggunaanAir penggunaanAir : penggunaanAirs) {
			returnList.set(penggunaanAir.getBulan() - 1, penggunaanAir);
		}

		return returnList;
	}

	public PenggunaanAir getPenggunaanAir(int akaun_id, int bulan, int tahun) {
		String SQL = "SELECT * FROM penggunaan_Air WHERE akaun_id=? AND bulan=? AND tahun=?";
		Object args[] = { akaun_id, bulan, tahun };

		PenggunaanAir penggunaanAir;

		try {
			penggunaanAir = jdbct.queryForObject(SQL, new BeanPropertyRowMapper<PenggunaanAir>(PenggunaanAir.class),
					args);

			return penggunaanAir;

		} catch (EmptyResultDataAccessException e) {
			// No form existed for this exact date yet

			return null;
		}
	}

	// INSERT NILAI Air FORM TO DB
	public void insertAir_nilai(PenggunaanAir air) {
		String sql = "insert into "
				+ "penggunaan_air(akaun_id, bil_hari, prorata, isipadu_air, harga_isipadu, bulan, tahun, pelepasan_karbon, is_complete) "
				+ "values(?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE prorata=?, isipadu_air=?, harga_isipadu=?, bil_hari=?, pelepasan_karbon=?";
		// insert into starts here
		Object args[] = { air.getAkaun_id(), air.getBil_hari(), air.getProrata(), air.getIsipadu_air(),
				air.getHarga_isipadu(), air.getBulan(), air.getTahun(), air.getPelepasan_karbon(), false,
				air.getProrata(), air.getIsipadu_air(), air.getHarga_isipadu(), air.getBil_hari(),
				air.getPelepasan_karbon() }; // on duplicate end

		jdbct.update(sql, args);
	}

	// INSERT SALINAN AIR FORM TO DB
	public void insertAir_salinan(String fileURL, int akaun_id, int bulan, int tahun) {

		// WILL INSERT IF EXIST OR UPDATE
		String SQL = "INSERT INTO penggunaan_air(akaun_id, fail_url, bulan, tahun, is_complete) VALUES(?, ?, ?, ?, 0) ON DUPLICATE KEY UPDATE fail_url=?";
		Object args[] = { akaun_id, fileURL, bulan, tahun, fileURL };

		jdbct.update(SQL, args);
	}

	//GET PELEPASAN KARBON AIR  BY KAWASAN_ID
    public float getJumlahKarbonKawasan_Air(int kawasan_id) {
        String SQL = "SELECT SUM(pe.pelepasan_karbon) FROM penggunaan_air pe JOIN alamat al ON (al.akaun_id = pe.akaun_id) WHERE al.kawasan_id=?";

		Object agr[] ={kawasan_id};
        @SuppressWarnings("deprecation")
        Float totalCarbon = jdbct.queryForObject(SQL, agr, Float.class);
        if (totalCarbon == null)
            return 0;

        return totalCarbon;
    }

	    //GET JUMLAH ISIPADU AIR BY KAWASAN_ID
		public float getJumlahAirKawasan(int kawasan_id){
			String SQL = "SELECT SUM(pe.isipadu_air) FROM penggunaan_air pe JOIN alamat al ON (al.akaun_id = pe.akaun_id) WHERE al.kawasan_id=?";
			
			Object agr[] ={kawasan_id};
			@SuppressWarnings("deprecation")
			Float totalAir = jdbct.queryForObject(SQL, agr, Float.class);	
			if (totalAir == null)
				return 0;
	
			return totalAir;
		}
	
	

	private DataSource getDataSource() {
		DataSource ds = null;
		String dbURL = "jdbc:mysql://localhost:3306/mbip_low_carbon";
		String username = "root";
		String password = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ds = new DriverManagerDataSource(dbURL, username, password);
		return ds;
	}

	public boolean isAllComplete(List<PenggunaanAir> listAir, int start, int end) {
		for (int i = start; i < end; i++) {
			if (!listAir.get(i).isComplete())
				return false;
		}

		return true;
	}
}
