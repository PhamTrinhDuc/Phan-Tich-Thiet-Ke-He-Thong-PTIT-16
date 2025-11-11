package org.example.model;
import java.util.Date;

public class Customer extends User {
    private String codeCustomer;
    private int point;

    public Customer() {}

    public Customer(String name,
                    String userName,
                    String email,
                    String birthday,
                    String address,
                    String gender,
                    String password,
                    String codeCustomer,
                    int point) {
        super(name, email, userName, birthday, address, gender, password);
        this.codeCustomer = codeCustomer;
        this.point = point;
    }

    public String getCodeCustomer() {
        return codeCustomer;
    }

    public void setCodeCustomer(String codeCustomer) {
        this.codeCustomer = codeCustomer;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}
