package utils;


import po.User;

/**
 * @author 14158
 */
public class UserThreadLocal {

    private UserThreadLocal(){}

    private static final ThreadLocal<User> LOCAL = new ThreadLocal<>();
    public static User get(){
        return LOCAL.get();
    }

    public static void put(User user){
        LOCAL.set(user);
    }
    public static void remove(){
        LOCAL.remove();
    }
}
