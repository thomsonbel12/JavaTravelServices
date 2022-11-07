package entity;

import java.util.Date;

public class Bill_Detail {
	private int Bill_Detail_id;
	private Date CheckIn_date;
	private Date CheckOut_date;
	private int Total_rooms;
	private int Total_money;
	private int Adult;
	private int Children;
	private int Room_id;
	private int Bill_id;
	public Bill_Detail() {
		super();
	}
	public Bill_Detail(int bill_Detail_id, Date checkIn_date, Date checkOut_date, int total_rooms, int total_money,
			int adult, int children, int room_id, int bill_id) {
		super();
		Bill_Detail_id = bill_Detail_id;
		CheckIn_date = checkIn_date;
		CheckOut_date = checkOut_date;
		Total_rooms = total_rooms;
		Total_money = total_money;
		Adult = adult;
		Children = children;
		Room_id = room_id;
		Bill_id = bill_id;
	}
	public int getBill_Detail_id() {
		return Bill_Detail_id;
	}
	public void setBill_Detail_id(int bill_Detail_id) {
		Bill_Detail_id = bill_Detail_id;
	}
	public Date getCheckIn_date() {
		return CheckIn_date;
	}
	public void setCheckIn_date(Date checkIn_date) {
		CheckIn_date = checkIn_date;
	}
	public Date getCheckOut_date() {
		return CheckOut_date;
	}
	public void setCheckOut_date(Date checkOut_date) {
		CheckOut_date = checkOut_date;
	}
	public int getTotal_rooms() {
		return Total_rooms;
	}
	public void setTotal_rooms(int total_rooms) {
		Total_rooms = total_rooms;
	}
	public int getTotal_money() {
		return Total_money;
	}
	public void setTotal_money(int total_money) {
		Total_money = total_money;
	}
	public int getAdult() {
		return Adult;
	}
	public void setAdult(int adult) {
		Adult = adult;
	}
	public int getChildren() {
		return Children;
	}
	public void setChildren(int children) {
		Children = children;
	}
	public int getRoom_id() {
		return Room_id;
	}
	public void setRoom_id(int room_id) {
		Room_id = room_id;
	}
	public int getBill_id() {
		return Bill_id;
	}
	public void setBill_id(int bill_id) {
		Bill_id = bill_id;
	}
	@Override
	public String toString() {
		return "Bill_Detail [Bill_Detail_id=" + Bill_Detail_id + ", CheckIn_date=" + CheckIn_date + ", CheckOut_date="
				+ CheckOut_date + ", Total_rooms=" + Total_rooms + ", Total_money=" + Total_money + ", Adult=" + Adult
				+ ", Children=" + Children + ", Room_id=" + Room_id + ", Bill_id=" + Bill_id + "]";
	}
	
}
