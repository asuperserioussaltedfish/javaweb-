package config;

import org.springframework.jdbc.core.JdbcTemplate;
import utils.DBUtils;


public class JdbcConfig {

    public static JdbcTemplate jdbcTemplate(){
        return new JdbcTemplate(DBUtils.getDataSource());
    }

}
