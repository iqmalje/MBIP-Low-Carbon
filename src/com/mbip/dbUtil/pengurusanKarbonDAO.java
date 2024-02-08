package com.mbip.dbUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class pengurusanKarbonDAO {

    JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

    //GET JUMLAH CO2 ELEKTRIK
    public double getJumlahKarbon_Elektrik(){

        String sql = "select pelepasan_karbon from penggunaan_elektrik";

        List<Double> floatValues = jdbct.query(sql, (resultSet, rowNum) -> resultSet.getDouble("pelepasan_karbon"));

        double sum = floatValues.stream().mapToDouble(Double::doubleValue).sum();
        
        return sum;
    }

    //GET JUMLAH CO2 AIR
    public double getJumlahKarbon_Air(){

        String sql = "select pelepasan_karbon from penggunaan_air";

        List<Double> floatValues = jdbct.query(sql, (resultSet, rowNum) -> resultSet.getDouble("pelepasan_karbon"));

        double sum = floatValues.stream().mapToDouble(Double::doubleValue).sum();
        
        return sum;
    }

    //GET JUMLAH CO2 KITAR SEMULA
    public double getJumlahKarbon_KitarSemula(){

        String sql = "select pelepasan_karbon from penggunaan_kitar_semula";

        List<Double> floatValues = jdbct.query(sql, (resultSet, rowNum) -> resultSet.getDouble("pelepasan_karbon"));

        double sum = floatValues.stream().mapToDouble(Double::doubleValue).sum();
        
        return sum;
    }

    //GET JUMLAH PESERTA
    public int getJumlahPeserta(){
        String sql = "SELECT COUNT(*) FROM akaun WHERE is_admin = '0'";

        Integer rowCount = jdbct.queryForObject(sql, Integer.class);
        int count = (rowCount != null) ? rowCount : 0;
        return count;
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
