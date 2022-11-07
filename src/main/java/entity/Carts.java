package entity;

import java.sql.Date;

public class Carts {
	private int Cart_id;
	private Date CheckIn_date;
	private Date CheckOut_date;
	private int Total_rooms;
	private int User_id;
	private int Room_id;
	public Carts() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Carts(int Cart_id, Date CheckIn_date, Date CheckOut_date, int Total_rooms, int User_id, int Room_id) {
		
		this.Cart_id = Cart_id;
		this.CheckIn_date = CheckIn_date;
		this.CheckOut_date = CheckOut_date;
		this.Total_rooms = Total_rooms;
		this.User_id = User_id;
		this.Room_id = Room_id;
	}
	public int getCart_id() {
		return Cart_id;
	}
	public void setCart_id(int cart_id) {
		Cart_id = cart_id;
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
	public int getUser_id() {
		return User_id;
	}
	public void setUser_id(int user_id) {
		User_id = user_id;
	}
	public int getRoom_id() {
		return Room_id;
	}
	public void setRoom_id(int room_id) {
		Room_id = room_id;
	}
	@Override
	public String toString() {
		return "Carts [Cart_id=" + Cart_id + ", CheckIn_date=" + CheckIn_date + ", CheckOut_date=" + CheckOut_date
				+ ", Total_rooms=" + Total_rooms + ", User_id=" + User_id + ", Room_id=" + Room_id + ", getCart_id()="
				+ getCart_id() + ", getCheckIn_date()=" + getCheckIn_date() + ", getCheckOut_date()="
				+ getCheckOut_date() + ", getTotal_rooms()=" + getTotal_rooms() + ", getUser_id()=" + getUser_id()
				+ ", getRoom_id()=" + getRoom_id() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}
