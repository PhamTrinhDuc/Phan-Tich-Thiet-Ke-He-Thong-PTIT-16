package org.example.model;

public class Seat {
    private int id;
    private int number;
    private String type;

    public Seat() {
    }

    public Seat(int id, int number, String type) {
        this.id = id;
        this.number = number;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
