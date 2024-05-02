package po;

import lombok.Data;

/**
 * @author SaltedFish
 */
@Data
public class User {
    private int id;
    private String account;
    private String password;

    public User(String account, String password) {
        this.account = account;
        this.password = password;
    }

    public User() {
    }
}
