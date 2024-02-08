package com.mbip.dbUtil;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.mbip.model.PenggunaanElektrik;

public class PenggunaanElektrikDAO {

    @SuppressWarnings("null")
    JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

    // GET ALL ELEKTRIK BY id and tahun
    public List<PenggunaanElektrik> getUserPenggunaanElektrikOverview(int akaunid, int tahun) {
        // String sql = "SELECT * FROM penggunaan_air WHERE akaun_id=? AND tahun=?";
        // Object args[] = {akaunid, tahun};
        // List<PenggunaanAir> penggunaanAirs = jdbct.query(sql, new
        // BeanPropertyRowMapper<PenggunaanAir>(PenggunaanAir.class), args);
        // /*
        // * Since we will use 12 months in the dashboard regardless, thus we just
        // prepare an ArrayList of 12
        // */

        // List<PenggunaanAir> returnList = new ArrayList<PenggunaanAir>();

        // for (int i = 0; i < 12; i++) {
        // returnList.add(new PenggunaanAir());
        // }
        // for (PenggunaanAir penggunaanAir : penggunaanAirs) {
        // returnList.set(penggunaanAir.getBulan()-1, penggunaanAir);
        // }

        // return returnList;
        String sql = "SELECT * FROM penggunaan_elektrik WHERE akaun_id=? AND tahun=?";
        Object args[] = { akaunid, tahun };
        List<PenggunaanElektrik> penggunaanElektriks = jdbct.query(sql,
                new BeanPropertyRowMapper<PenggunaanElektrik>(PenggunaanElektrik.class), args);

        List<PenggunaanElektrik> returnList = new ArrayList<PenggunaanElektrik>();

        for (int i = 0; i < 12; i++) {
            returnList.add(new PenggunaanElektrik());
        }

        for (PenggunaanElektrik penggunaanElektrik : penggunaanElektriks) {
            returnList.set(penggunaanElektrik.getBulan() - 1, penggunaanElektrik);
        }

        return returnList;
    }

    public PenggunaanElektrik getPenggunaanElektrik(int akaun_id, int bulan, int tahun) {
        String SQL = "SELECT * FROM penggunaan_elektrik WHERE akaun_id=? AND bulan=? AND tahun=?";
        Object args[] = { akaun_id, bulan, tahun };

        PenggunaanElektrik penggunaanElektrik;

        try {
            penggunaanElektrik = jdbct.queryForObject(SQL,
                    new BeanPropertyRowMapper<PenggunaanElektrik>(PenggunaanElektrik.class), args);

            return penggunaanElektrik;

        } catch (EmptyResultDataAccessException e) {
            // No form existed for this exact date yet

            return null;
        }
    }

    // INSERT NILAI ELEKTRIK FORM TO DB
    public void insertElektrik_Nilai(PenggunaanElektrik elektrik) {
        String sql = "insert into "
                + "penggunaan_elektrik(ID, akaun_id, bil_hari, prorata, tenaga_elektrik, harga_elektrik, bulan, tahun, pelepasan_karbon, is_complete) "
                + "values(?,?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE prorata=?, tenaga_elektrik=?, harga_elektrik=?, is_complete=?, bil_hari=?, pelepasan_karbon=?";

        Object args[] = { elektrik.getID(), elektrik.getAkaun_id(), elektrik.getBil_hari(), // insert into starts here
                elektrik.getProrata(), elektrik.getTenaga_elektrik(), elektrik.getHarga_elektrik(), elektrik.getBulan(),
                elektrik.getTahun(), elektrik.getPelepasan_karbon(), 1, // insert into end
                elektrik.getProrata(), elektrik.getTenaga_elektrik(), // on duplicate starts here
                elektrik.getHarga_elektrik(), 1, elektrik.getBil_hari(), elektrik.getPelepasan_karbon() }; // on
                                                                                                           // duplicate
                                                                                                           // end

        jdbct.update(sql, args);
    }

    // INSERT SALINAN ELEKTRIK FORM TO DB
    public void insertElektrik_Salinan(String fileURL, int akaun_id, int bulan, int tahun) {

        // WILL INSERT IF EXIST OR UPDATE
        String SQL = "INSERT INTO penggunaan_elektrik(akaun_id, fail_url, bulan, tahun, is_complete) VALUES(?, ?, ?, ?, 0) ON DUPLICATE KEY UPDATE fail_url=?";
        Object args[] = { akaun_id, fileURL, bulan, tahun, fileURL };

        jdbct.update(SQL, args);
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

    // GET JUMLAH CO2 BY KAWASAN_ID
    public float getJumlahKarbonKawasan_Elektrik(int kawasan_id) {
        String SQL = "SELECT SUM(pe.pelepasan_karbon) FROM penggunaan_elektrik pe JOIN alamat al ON (al.akaun_id = pe.akaun_id) WHERE al.kawasan_id=?";

        Object agr[] = { kawasan_id };
        @SuppressWarnings("deprecation")
        Float totalCarbon = jdbct.queryForObject(SQL, agr, Float.class);
        if (totalCarbon == null)
            return 0;

        return totalCarbon;
    }

    // GET JUMLAH ELEKTRIK BY KAWASAN_ID
    public float getJumlahElektrikKawasan(int kawasan_id) {
        String SQL = "SELECT SUM(pe.tenaga_elektrik) FROM penggunaan_elektrik pe JOIN alamat al ON (al.akaun_id = pe.akaun_id) WHERE al.kawasan_id=?";

        Object agr[] = { kawasan_id };
        @SuppressWarnings("deprecation")
        Float totalElektrik = jdbct.queryForObject(SQL, agr, Float.class);
        if (totalElektrik == null)
            return 0;

        return totalElektrik;
    }

    public boolean isAllComplete(List<PenggunaanElektrik> listElektrik, int start, int end) {
        for (int i = start; i < end; i++) {
            if (!listElektrik.get(i).isComplete())
                return false;
        }

        return true;
    }
}
