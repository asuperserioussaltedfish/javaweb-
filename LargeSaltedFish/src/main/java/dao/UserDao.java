package dao;

import po.User;

/**
 * @author SaltedFish
 */
public interface UserDao {
    boolean hasMatchUser(String account,String password);
    boolean findUserByAccount(String account);
    User registerUser(String account, String password);

}
