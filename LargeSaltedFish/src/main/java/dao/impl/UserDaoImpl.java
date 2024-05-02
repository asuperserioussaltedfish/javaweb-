package dao.impl;

import config.JdbcConfig;
import dao.UserDao;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import po.User;


/**
 * @author SaltedFish
 */
public class UserDaoImpl implements UserDao {
    private final JdbcTemplate jdbcTemplate = JdbcConfig.jdbcTemplate();

    @Override
    public boolean hasMatchUser(String account, String password) {
        String sql = "SELECT COUNT(*) FROM user WHERE account=? AND password=?";
        try {
            int count = jdbcTemplate.queryForObject(sql, new Object[]{account, password}, Integer.class);
            System.out.println("查找成功");
            return count == 1;
        } catch (DataAccessException e) {
            throw new RuntimeException("find error:" + e.getMessage(), e);
        }
    }

    @Override
    public boolean findUserByAccount(String account) {
        String sql = "select count(*) from user where account = ?";
        try {
            Integer count = jdbcTemplate.queryForObject(sql, new Object[]{account}, Integer.class);
            // 如果计数大于0，表示找到了至少一个匹配的用户
            return count != null && count > 0;
        } catch (EmptyResultDataAccessException e) {
            // 查询没有返回结果
            return false;
        }
    }

    public User registerUser(String account, String password) {
        String sql = "INSERT INTO user (account, password) VALUES (?, ?)";
        // 返回更新的行数
        int updateRowCount = jdbcTemplate.update(sql,  account, password);
        if (updateRowCount > 0) {
            //保存成功
            return new User(account, password);
        } else {
            // 保存失败
            return null;
        }
    }
}
