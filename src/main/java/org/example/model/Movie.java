package org.example.model;

public class Movie {
    private int id;
    private String name;
    private String desc;
    private String genre;
    private int duration;
    private String language;

    public Movie() {}

    public Movie(int id, String name, String desc, String genre, int duration, String language) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.genre = genre;
        this.duration = duration;
        this.language = language;
    }
    public int getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public String getDesc() {
        return desc;
    }
    public String getGenre() {
        return genre;
    }
    public int getDuration() {
        return duration;
    }
    public String getLanguage() {
        return language;
    }
    public void setId(int id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
    public void setGenre(String genre) {
        this.genre = genre;
    }
    public void setDuration(int duration) {
        this.duration = duration;
    }
    public void setLanguage(String language) {
        this.language = language;
    }
}
