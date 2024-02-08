package com.mbip.dbUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.mbip.model.Kawasan;

public class KawasanDAO {
	@SuppressWarnings("null")
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public List<Kawasan> getAll() {
		String SQL = "SELECT kawasan_id, NAMA, DUN, PARLIMEN FROM kawasan";

		List<Kawasan> kawasans = jdbct.query(SQL, new BeanPropertyRowMapper<Kawasan>(Kawasan.class));

		return kawasans;
	}

	public Kawasan get(int kawasanid) {
		String SQL = "SELECT * FROM kawasan WHERE kawasan_id=?";
		Kawasan kawasan = jdbct.queryForObject(SQL, new BeanPropertyRowMapper<Kawasan>(Kawasan.class), kawasanid);

		return kawasan;
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
