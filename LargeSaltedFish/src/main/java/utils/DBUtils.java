package utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DBUtils {

    private static DataSource ds = null;

    static {
        // 创建数据库连接池对象
        InputStream is = DBUtils.class.getClassLoader().getResourceAsStream("druid.properties");
        Properties pp = new Properties();
        try {
            pp.load(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 获取链接
//        DataSource ds = null;
        try {
            ds = DruidDataSourceFactory.createDataSource(pp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static DataSource getDataSource() {
        return ds;
    }

}
