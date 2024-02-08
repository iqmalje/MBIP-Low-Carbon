package com.mbip.dbUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.mbip.model.Alamat;
import com.mbip.model.Kawasan;
import com.mbip.model.User;

public class UserDAO {

	@SuppressWarnings("null")
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public User loginPeserta(String email, String password) throws EmptyResultDataAccessException {

		String sql = "SELECT * FROM akaun WHERE email=? AND password=?";
		Object args[] = { email, password };
		User user = jdbct.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), args);
		user.setIsAdmin(false);

		// get akaun
		sql = "SELECT * FROM alamat WHERE akaun_id=?";
		@SuppressWarnings("null")
		Object args2[] = { user.getAkaun_id() };
		Alamat alamat = null;
		try {
			alamat = jdbct.queryForObject(sql, new BeanPropertyRowMapper<Alamat>(Alamat.class), args2);
		} catch (EmptyResultDataAccessException e) {
			// thats okay because not everyone has alamat yet!
		}

		user.setAlamat(alamat);

		return user;
	}

	public User loginAdmin(String email, String password) {
		String sql = "SELECT * FROM akaun WHERE email=? AND password=? AND is_admin=1";
		Object args[] = { email, password };
		// throws emptyresultdata since no associate admin acc found!
		User user = jdbct.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), args);
		// get akaun
		sql = "SELECT * FROM alamat WHERE akaun_id=?";
		@SuppressWarnings("null")
		Object args2[] = { user.getAkaun_id() };
		Alamat alamat = null;
		try {
			alamat = jdbct.queryForObject(sql, new BeanPropertyRowMapper<Alamat>(Alamat.class), args2);
		} catch (EmptyResultDataAccessException e) {
			// thats okay because not everyone has alamat yet!
		}

		user.setAlamat(alamat);

		return user;
	}

	public void register(String email, String namaPenuh, String password) {
		String SQL = "INSERT INTO akaun(email, nama_penuh, password) VALUES (?, ?, ?)";
		Object args[] = { email, namaPenuh, password };

		jdbct.update(SQL, args);

	}

	public void update(User user) {
		String SQL = "UPDATE akaun SET email=?, nama_penuh=?, IC_no=?, nombor_telefon=?, institusi=?, status=? WHERE akaun_id=?";
		Object args[] = { user.getEmail(), user.getNamaPenuh(), user.getICNo(), user.getNomborTelefon(),
				user.getInstitusi(), user.getStatus(), user.getAkaun_id() };

		jdbct.update(SQL, args);
	}

	public void updateAlamat(Alamat alamat, int akaun_id) {

		// incase the user wants to update instead of only insert
		String SQL = "INSERT INTO Alamat(akaun_id, alamat, bandar, poskod, kategori, bilangan_isi_rumah, kawasan_id) VALUES (?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE alamat=?, bandar=?, poskod=?, kategori=?, bilangan_isi_rumah=?, kawasan_id=?";

		Object args[] = { akaun_id, alamat.getAlamat(), alamat.getBandar(), alamat.getPoskod(), alamat.getKategori(),
				alamat.getBilangan_isi_rumah(), alamat.getKawasan_id(), alamat.getAlamat(), alamat.getBandar(),
				alamat.getPoskod(), alamat.getKategori(), alamat.getBilangan_isi_rumah(), alamat.getKawasan_id() };

		jdbct.update(SQL, args);

	}

	public List<Kawasan> getListOfKawasan() {
		String SQL = "SELECT * FROM kawasan";
		List<Kawasan> kawasans = jdbct.query(SQL, new BeanPropertyRowMapper<Kawasan>(Kawasan.class));

		return kawasans;
	}

	public Kawasan getKawasan(int kawasan_id) {
		String SQL = "SELECT * FROM kawasan WHERE kawasan_id=?";
		Object args[] = { kawasan_id };
		Kawasan kawasan = jdbct.queryForObject(SQL, new BeanPropertyRowMapper<Kawasan>(Kawasan.class), args);

		return kawasan;
	}

	@SuppressWarnings("null")
	public User getUser(int akaun_id) {
		String SQL = "SELECT * FROM akaun WHERE akaun_id=?";
		Object args[] = { akaun_id };
		User user = jdbct.queryForObject(SQL, new BeanPropertyRowMapper<User>(User.class), args);
		// get alamat
		SQL = "SELECT * FROM ALAMAT WHERE akaun_id=?";
		Alamat alamat;
		try {
			alamat = jdbct.queryForObject(SQL, new BeanPropertyRowMapper<Alamat>(Alamat.class), args);

		} catch (EmptyResultDataAccessException e) {
			// user did not register for alamat yet
			alamat = new Alamat();
		}
		user.setAlamat(alamat);

		return user;
	}

	public List<User> getUserInKawasan(int kawasan_id) {
		String SQL = "SELECT a.* FROM akaun a JOIN alamat al ON (a.akaun_id=al.akaun_id) JOIN alamat ala ON (al.kawasan_id=ala.kawasan_id) WHERE ala.kawasan_id=?";
		Object args[] = { kawasan_id };

		List<User> users = jdbct.query(SQL, new BeanPropertyRowMapper<User>(User.class), args);

		// get alamat for each
		SQL = "SELECT * FROM alamat WHERE akaun_id=?";

		for (User user : users) {
			Object args2[] = { user.getAkaun_id() };
			Alamat alamat = jdbct.queryForObject(SQL, new BeanPropertyRowMapper<Alamat>(Alamat.class), args2);
			user.setAlamat(alamat);
		}

		return users;
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
