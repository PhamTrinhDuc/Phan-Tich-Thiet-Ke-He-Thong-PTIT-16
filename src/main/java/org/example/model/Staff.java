package org.example.model;

public class Staff extends User{

    private String position;

    public Staff() {
    }

    public Staff(String name,
                 String email,
                 String userName,
                 String birthday,
                 String address,
                 String gender,
                 String password,
                 String position) {
        super(name, email, userName, birthday, address, gender, password);
        this.position = position;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
