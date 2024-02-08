package com.mbip.dbUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.mbip.model.Penyertaan;
import com.mbip.model.Pertandingan;
import com.mbip.model.User;

public class PertandinganDAO {

	@SuppressWarnings("null")
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public int getPesertaCount(int pertandingan_id) {
		String SQL = "SELECT count(*) FROM penyertaan WHERE pertandingan_id=?";
		Object args[] = { pertandingan_id };
		Integer pesertaCount = jdbct.queryForObject(SQL, Integer.class, args);

		return pesertaCount;
	}

	public void addPertandingan(Pertandingan pertandingan) {
		String SQL = "INSERT INTO pertandingan(name, status, tahun, kategori, start_month, end_month) VALUES(?, ?, ?, ?, ?, ?)";
		Object args[] = { pertandingan.getName(), pertandingan.getStatus(), pertandingan.getTahun(),
				pertandingan.getKategori(), pertandingan.getStart_month(), pertandingan.getEnd_month() };

		jdbct.update(SQL, args);
	}

	public void updatePertandingan(Pertandingan pertandingan) {
		String SQL = "UPDATE pertandingan SET name=?, status=?, tahun=?, kategori=?, start_month=?, end_month=? WHERE pertandingan_id=?";
		Object args[] = { pertandingan.getName(), pertandingan.getStatus(), pertandingan.getTahun(),
				pertandingan.getKategori(), pertandingan.getStart_month(), pertandingan.getEnd_month(),
				pertandingan.getPertandingan_id() };

		jdbct.update(SQL, args);
	}

	public Pertandingan getPertandingan(int pertandingan_id) {
		String sql = "SELECT * FROM pertandingan WHERE pertandingan_id=?";
		Pertandingan pertandingan = jdbct.queryForObject(sql,
				new BeanPropertyRowMapper<Pertandingan>(Pertandingan.class), pertandingan_id);
		return pertandingan;
	}

	// senarai all pertandingan
	public List<Pertandingan> getAllPertandingan() {

		String SQL = "SELECT * FROM Pertandingan";
		List<Pertandingan> pertandingans = jdbct.query(SQL,
				new BeanPropertyRowMapper<Pertandingan>(Pertandingan.class));

		return pertandingans;
	}

	public void sertaiPertandingan(int pertandingan_id, int akaun_id) throws DuplicateKeyException {

		String SQL = "INSERT INTO penyertaan(pertandingan_id, akaun_id, status) VALUES(?, ?, ?)";
		Object args[] = { pertandingan_id, akaun_id, "Penilaian" };
		jdbct.update(SQL, args);
	}

	public List<Penyertaan> getJoinedPenyertaan(User user) {
		String SQL = "SELECT * from penyertaan WHERE akaun_id = ?";
		Object args[] = { user.getAkaun_id() };

		List<Penyertaan> penyertaans = jdbct.query(SQL, new BeanPropertyRowMapper<Penyertaan>(Penyertaan.class), args);

		for (Penyertaan penyertaan : penyertaans) {
			System.out.println(penyertaan.getPenyertaan_id());

			String SQLPERTANDINGAN = "SELECT * FROM pertandingan WHERE pertandingan_id=?";

			System.out.println("SQL PERTANDINGAN = " + SQLPERTANDINGAN);
			Pertandingan pertandingan = jdbct.queryForObject(SQLPERTANDINGAN,
					new BeanPropertyRowMapper<Pertandingan>(Pertandingan.class), penyertaan.getPertandingan_id());
			penyertaan.setPertandingan(pertandingan);
		}

		return penyertaans;
	}

	public List<User> getUserJoined(int pertandingan_id) {
		String SQL = "SELECT u.* FROM user u JOIN penyertaan p ON (p.akaun_id=u.akaun_id) WHERE p.pertandingan_id=?";
		Object args[] = { pertandingan_id };
		List<User> users = jdbct.query(SQL, new BeanPropertyRowMapper<User>(User.class), args);

		return users;
	}

	public void setStatusToDone(int pertandingan_id, int akaun_id) {
		String SQL = "UPDATE penyertaan SET status='Hantar' WHERE pertandingan_id=? AND akaun_id=?";
		Object args[] = { pertandingan_id, akaun_id };
		jdbct.update(SQL, args);
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
}
