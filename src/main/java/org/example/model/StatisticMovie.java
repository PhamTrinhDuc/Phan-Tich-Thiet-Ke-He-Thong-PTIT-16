package org.example.model;
import java.sql.Date;

public class StatisticMovie extends  Movie {
    private Date startDate;
    private Date endDate;
    private int totalTickets;
    private double totalRevenue;

    public StatisticMovie(){}

    public StatisticMovie(Date startDate, Date endDate, int totalTickets, long totalRevenue) {
        this.startDate =startDate;
        this.endDate = endDate;
        this.totalTickets = totalTickets;
        this.totalRevenue = totalRevenue;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getTotalTickets() {
        return totalTickets;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalTickets(int totalTickets) {
        this.totalTickets = totalTickets;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
}
