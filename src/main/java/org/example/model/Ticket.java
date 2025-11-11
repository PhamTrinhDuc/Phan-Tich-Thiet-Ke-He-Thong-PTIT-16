package org.example.model;
import java.util.Date;

public class Ticket {
    private int id;
    private float price;
    private Date createAt;
    private int seatId;
    private int showtimeId;
    private int BillId;

    public Ticket() {
    }
    public Ticket(int id, float price, Date createAt, int seatId, int showtimeId, int billId) {
        this.id = id;
        this.price = price;
        this.createAt = createAt;
        this.seatId = seatId;
        this.showtimeId = showtimeId;
        BillId = billId;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }
    public Date getCreateAt() {
        return createAt;
    }
    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
    public int getSeatId() {
        return seatId;
    }
    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }
    public int getShowtimeId() {
        return showtimeId;
    }
    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }
    public int getBillId() {
        return BillId;
    }
    public void setBillId(int billId) {
        BillId = billId;
    }
}
