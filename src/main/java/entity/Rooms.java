package entity;

public class Rooms {
	private int Room_id;
	private String Type;
	private String Image;
	private int Price;
	private int Adult;
	private int Children;
	private int Available_Room;
	private int Hotel_id;
	
	
	public Rooms() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Rooms(int Room_id, String Type, String Image, int Price, int Adult, int Children, int Available_Room, int Hotel_id) {
		this.Room_id=Room_id;
		this.Type=Type;
		this.Image=Image;
		this.Price=Price;
		this.Adult=Adult;
		this.Children=Children;
		this.Available_Room=Available_Room;
		this.Hotel_id=Hotel_id;
	}


	public int getRoom_id() {
		return Room_id;
	}


	public void setRoom_id(int room_id) {
		Room_id = room_id;
	}


	public String getType() {
		return Type;
	}


	public void setType(String type) {
		Type = type;
	}


	public int getPrice() {
		return Price;
	}


	public void setPrice(int price) {
		Price = price;
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


	public String getImage() {
		return Image;
	}


	public void setImage(String image) {
		Image = image;
	}


	public int getAvailable_Room() {
		return Available_Room;
	}


	public void setAvailable_Room(int available_Room) {
		Available_Room = available_Room;
	}


	public int getHotel_id() {
		return Hotel_id;
	}


	public void setHotel_id(int hotel_id) {
		Hotel_id = hotel_id;
	}


	@Override
	public String toString() {
		return "Rooms [Room_id=" + Room_id + ", Type=" + Type + ", Image=" + Image + ", Price=" + Price + ", Adult="
				+ Adult + ", Children=" + Children + ", Available_Room=" + Available_Room + ", Hotel_id=" + Hotel_id
				+ "]";
	}
}
