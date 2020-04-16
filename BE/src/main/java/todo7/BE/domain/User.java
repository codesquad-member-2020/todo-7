package todo7.BE.domain;

import org.springframework.data.annotation.Id;

public class User {
    @Id
    private int id;

    private String userName;

    private String password;

    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }
}
