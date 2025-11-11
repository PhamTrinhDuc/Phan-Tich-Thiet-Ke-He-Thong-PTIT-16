package org.example.model;

import java.util.List;

public class Room {
    private int id;
    private String name;
    private String type;
    private int capacity;
    private List<Seat> listSeat;

    public Room() {
    }

    public Room(int id, String name, String type, int capacity, List<Seat> listSeat) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.capacity = capacity;
        this.listSeat = listSeat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public List<Seat> getListSeat() {
        return listSeat;
    }

    public void setListSeat(List<Seat> listSeat) {
        this.listSeat = listSeat;
    }
}
