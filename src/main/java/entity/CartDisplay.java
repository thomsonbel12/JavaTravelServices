package entity;

import java.sql.Date;

public class CartDisplay {
	private int Cart_id;
	private Date CheckIn_date;
	private Date CheckOut_date;
	private int Total_rooms;
	private String Name_hotel;
	private int Price_room;
	private String Image;
	private String Type;
	private int Adult;
	private int Children;
	private int User_id;
	private int Room_id;
	private int Hotel_id;
	private int Available_Room;
	private int Max_Adult;
	private int Max_Children;
	public CartDisplay() {
		super();
	}
	public CartDisplay(int cart_id, Date checkIn_date, Date checkOut_date, int total_rooms, String name_hotel,
			int price_room, String image, String type, int adult, int children, int user_id, int room_id, int hotel_id,
			int available_Room, int max_Adult, int max_Children) {
		super();
		Cart_id = cart_id;
		CheckIn_date = checkIn_date;
		CheckOut_date = checkOut_date;
		Total_rooms = total_rooms;
		Name_hotel = name_hotel;
		Price_room = price_room;
		Image = image;
		Type = type;
		Adult = adult;
		Children = children;
		User_id = user_id;
		Room_id = room_id;
		Hotel_id = hotel_id;
		Available_Room = available_Room;
		Max_Adult = max_Adult;
		Max_Children = max_Children;
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
	public String getName_hotel() {
		return Name_hotel;
	}
	public void setName_hotel(String name_hotel) {
		Name_hotel = name_hotel;
	}
	public int getPrice_room() {
		return Price_room;
	}
	public void setPrice_room(int price_room) {
		Price_room = price_room;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
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
	public int getHotel_id() {
		return Hotel_id;
	}
	public void setHotel_id(int hotel_id) {
		Hotel_id = hotel_id;
	}
	public int getAvailable_Room() {
		return Available_Room;
	}
	public void setAvailable_Room(int available_Room) {
		Available_Room = available_Room;
	}
	public int getMax_Adult() {
		return Max_Adult;
	}
	public void setMax_Adult(int max_Adult) {
		Max_Adult = max_Adult;
	}
	public int getMax_Children() {
		return Max_Children;
	}
	public void setMax_Children(int max_Children) {
		Max_Children = max_Children;
	}
	@Override
	public String toString() {
		return "CartDisplay [Cart_id=" + Cart_id + ", CheckIn_date=" + CheckIn_date + ", CheckOut_date=" + CheckOut_date
				+ ", Total_rooms=" + Total_rooms + ", Name_hotel=" + Name_hotel + ", Price_room=" + Price_room
				+ ", Image=" + Image + ", Type=" + Type + ", Adult=" + Adult + ", Children=" + Children + ", User_id="
				+ User_id + ", Room_id=" + Room_id + ", Hotel_id=" + Hotel_id + ", Available_Room=" + Available_Room
				+ ", Max_Adult=" + Max_Adult + ", Max_Children=" + Max_Children + "]";
	}
	
	
	
}
