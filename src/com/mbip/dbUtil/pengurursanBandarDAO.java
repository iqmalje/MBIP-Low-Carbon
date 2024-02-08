package com.mbip.dbUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class pengurursanBandarDAO {

    JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

    // GET JUMLAH PARTICIPANT IN A BANDAR
    public int getJumlahPesertaBandar(int kawasan_id) {

        String sql = "SELECT COUNT(*) FROM akaun a JOIN alamat b ON a.akaun_id = b.akaun_id WHERE a.is_admin = 0 AND b.kawasan_id = "
                + kawasan_id;

        return jdbct.queryForObject(sql, Integer.class);
    }

    // GET JUMLAH ELEKTRIK
    @SuppressWarnings("deprecation")
    public float getJumlahElektrikBandar(int kawasan_id) {
            JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
    
            String sql = "SELECT SUM(e.tenaga_elektrik) FROM akaun a " +
                         "JOIN alamat b ON a.akaun_id = b.akaun_id " +
                         "JOIN penggunaan_elektrik e ON a.akaun_id = e.akaun_id " +
                         "WHERE a.is_admin = 0 AND b.kawasan_id = ?";
            Object arg[] = {kawasan_id};
    
            Float result = jdbct.queryForObject(sql, arg, Float.class);
            return result != null ? result.floatValue() : 0f;
    }

    // GET JUMLAH AIR
    @SuppressWarnings("deprecation")
    public float getJumlahAirBandar(int kawasan_id) {
            JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
    
            String sql = "SELECT COALESCE(SUM(e.isipadu_air), 0) FROM akaun a " +
            "JOIN alamat b ON a.akaun_id = b.akaun_id " +
            "JOIN penggunaan_air e ON a.akaun_id = e.akaun_id " +
            "WHERE a.is_admin = 0 AND b.kawasan_id = ?";
            
            Object arg[] = {kawasan_id};
    
            Float result = jdbct.queryForObject(sql, arg, Float.class);
            return result != null ? result.floatValue() : 0f;
    }

    // GET JUMLAH KITAR SEMULA
    @SuppressWarnings("deprecation")
    public float getJumlahKitarSemulaBandar(int kawasan_id) {
            JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
    
            String sql = "SELECT COALESCE(SUM(e.jisim_bahan), 0) FROM akaun a " +
            "JOIN alamat b ON a.akaun_id = b.akaun_id " +
            "JOIN penggunaan_kitar_semula e ON a.akaun_id = e.akaun_id " +
            "WHERE a.is_admin = 0 AND b.kawasan_id = ?";
            Object arg[] = {kawasan_id};
    
            Float result = jdbct.queryForObject(sql, arg, Float.class);
            return result != null ? result.floatValue() : 0f;
    }
    
    //GET JUMLAH CO2 BANDAR
    @SuppressWarnings("deprecation")
    public Float getJumlahkarbonBandar(int kawasan_id) {
        String sql = "SELECT COALESCE(SUM(penggunaan_elektrik.pelepasan_karbon), 0) " +
                     "+ COALESCE(SUM(penggunaan_air.pelepasan_karbon), 0) " +
                     "+ COALESCE(SUM(penggunaan_kitar_semula.pelepasan_karbon), 0) AS total_karbon " +
                     "FROM akaun " +
                     "JOIN alamat ON akaun.akaun_id = alamat.akaun_id " +
                     "LEFT JOIN penggunaan_elektrik ON akaun.akaun_id = penggunaan_elektrik.akaun_id " +
                     "LEFT JOIN penggunaan_air ON akaun.akaun_id = penggunaan_air.akaun_id " +
                     "LEFT JOIN penggunaan_kitar_semula ON akaun.akaun_id = penggunaan_kitar_semula.akaun_id " +
                     "WHERE akaun.is_admin = 0 AND alamat.kawasan_id = ?";
        Object arg[] = {kawasan_id};
        return jdbct.queryForObject(sql, arg, Float.class);
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
}
