package com.mbip.dbUtil;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.mbip.model.PenggunaanElektrik;
import com.mbip.model.PenggunaanKitarSemula;

public class PenggunaanKitarSemulaDAO {
	@SuppressWarnings("null")
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	// GET ALL KITAR SEMULA BY id and tahun and akaun id
	public List<PenggunaanKitarSemula> getUserPenggunaanKitarSemulaOverview(int akaunid, int tahun) {

		String sql = "SELECT * FROM penggunaan_kitar_semula WHERE akaun_id=? AND tahun=?";
		Object args[] = { akaunid, tahun };
		List<PenggunaanKitarSemula> penggunaanKitarSemulaList = jdbct.query(sql,
				new BeanPropertyRowMapper<PenggunaanKitarSemula>(PenggunaanKitarSemula.class), args);

		List<PenggunaanKitarSemula> returnList = new ArrayList<PenggunaanKitarSemula>();

		for (int i = 0; i < 12; i++) {
			returnList.add(new PenggunaanKitarSemula());
		}

		for (PenggunaanKitarSemula penggunaanKitarSemula : penggunaanKitarSemulaList) {
			returnList.set(penggunaanKitarSemula.getBulan() - 1, penggunaanKitarSemula);
		}

		return returnList;
	}

	public PenggunaanKitarSemula getPenggunaanKitarSemula(int akaun_id, int bulan, int tahun) {
		String SQL = "SELECT * FROM penggunaan_kitar_semula WHERE akaun_id=? AND bulan=? AND tahun=?";
		Object args[] = { akaun_id, bulan, tahun };

		PenggunaanKitarSemula penggunaanKitarSemula;

		try {
			penggunaanKitarSemula = jdbct.queryForObject(SQL,
					new BeanPropertyRowMapper<PenggunaanKitarSemula>(PenggunaanKitarSemula.class), args);

			return penggunaanKitarSemula;

		} catch (EmptyResultDataAccessException e) {
			// No form existed for this exact date yet

			return null;
		}
	}

	// INSERT NILAI KITAR SEMULA FORM TO DB
	public void insertKitarSemula_nilai(PenggunaanKitarSemula kitarSemula) {
		String sql = "insert into "
				+ "penggunaan_kitar_semula(ID, akaun_id, jisim_bahan, nilai_collect_point, bulan, tahun, pelepasan_karbon, is_complete) "
				+ "values(?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE jisim_bahan=?, nilai_collect_point=?, pelepasan_karbon=?";

		Object args[] = { kitarSemula.getID(), kitarSemula.getAkaun_id(), kitarSemula.getJisim_bahan(), // insert into
																										// starts here
				kitarSemula.getNilai_collect_point(), kitarSemula.getBulan(), kitarSemula.getTahun(),
				kitarSemula.getPelepasan_karbon(), 1,
				// insert into end
				kitarSemula.getJisim_bahan(), kitarSemula.getNilai_collect_point(), // on duplicate starts here
				kitarSemula.getPelepasan_karbon() }; // on
														// duplicate
														// end

		jdbct.update(sql, args);
	}

	// INSERT SALINAN KITAR SEMULA FORM TO DB
	public void insertKitarSemula_Salinan(String fileURL, int akaun_id, int bulan, int tahun) {

		// WILL INSERT IF EXIST OR UPDATE
		String SQL = "INSERT INTO penggunaan_kitar_semula(akaun_id, fail_url, bulan, tahun, is_complete) VALUES(?, ?, ?, ?, 0) ON DUPLICATE KEY UPDATE fail_url=?";
		Object args[] = { akaun_id, fileURL, bulan, tahun, fileURL };

		jdbct.update(SQL, args);
	}

	//GET PELEPASAN KARBON KITAR SEMULA BY KAWASAN_ID
    public float getJumlahKarbonKawasan_KitarSemula(int kawasan_id) {
        String SQL = "SELECT SUM(pe.pelepasan_karbon) FROM penggunaan_kitar_semula pe JOIN alamat al ON (al.akaun_id = pe.akaun_id) WHERE al.kawasan_id=?";

        Object agr[] ={kawasan_id};
        @SuppressWarnings("deprecation")
        Float totalCarbon = jdbct.queryForObject(SQL, agr, Float.class);		

        if (totalCarbon == null)
            return 0;

        return totalCarbon;
	}

    //GET JUMLAH JISIM BY KAWASAN_ID
    public float getJumlahKitarSemulaKawasan(int kawasan_id){
        String SQL = "SELECT SUM(pe.jisim_bahan) FROM penggunaan_kitar_semula pe JOIN alamat al ON (al.akaun_id = pe.akaun_id) WHERE al.kawasan_id=?";

        Object agr[] ={kawasan_id};
        @SuppressWarnings("deprecation")
        Float totalKitarSemula = jdbct.queryForObject(SQL, agr, Float.class);

        if (totalKitarSemula == null)
            return 0;

        return totalKitarSemula;
    }	

	// DATABASE CONNECTION
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

	public boolean isAllComplete(List<PenggunaanKitarSemula> listKitarSemula, int start, int end) {
		for (int i = start; i < end; i++) {
			if (!listKitarSemula.get(i).isComplete())
				return false;
		}

		return true;
	}
}
