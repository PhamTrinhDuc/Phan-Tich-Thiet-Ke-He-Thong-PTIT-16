package org.example.model;

import java.util.*;

public class Showtime {
    private int id;
    private Date startTime;
    private Date endTime;
    private Movie movie;
    private Room room;

    public Showtime() {
    }
    public Showtime(int id, Date startTime, Date endTime, Movie movie, Room room) {
        this.id = id;
        this.startTime = startTime;
        this.endTime = endTime;
        this.room = room;
        this.movie = movie;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
}
