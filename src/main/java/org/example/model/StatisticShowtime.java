package org.example.model;

public class StatisticShowtime extends  Showtime{
    private int totalTickets;
    private double totalRevenue;

    public StatisticShowtime(){}

    public StatisticShowtime(int totalTickets, long totalRevenue) {
        this.totalTickets = totalTickets;
        this.totalRevenue = totalRevenue;
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
