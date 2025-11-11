package org.example.model;
import java.util.Date;

public class Customer extends User {
    private String codeCustomer;

    public Customer() {}

    public Customer(String name,
                    String userName,
                    String email,
                    String birthday,
                    String address,
                    String gender,
                    String password,
                    String codeCustomer) {
        super(name, email, userName, birthday, address, gender, password);
        this.codeCustomer = codeCustomer;
    }

    public String getCodeCustomer() {
        return codeCustomer;
    }

    public void setCodeCustomer(String codeCustomer) {
        this.codeCustomer = codeCustomer;
    }

}
