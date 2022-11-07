package entity;

public class Hotels {
	private int Hotel_id;
	private String Name_Hotel;
	private String Address;
	private String Decription;
	private int LandLord_id;
	public Hotels() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Hotels(int Hotel_id, String Name_Hotel, String Address, String Decription, int LandLord_id) {
		this.Hotel_id = Hotel_id;
		this.Name_Hotel = Name_Hotel;
		this.Address = Address;
		this.Decription = Decription;
		this.LandLord_id = LandLord_id;
	}
	public int getHotel_id() {
		return Hotel_id;
	}
	public void setHotel_id(int hotel_id) {
		Hotel_id = hotel_id;
	}
	public String getName_Hotel() {
		return Name_Hotel;
	}
	public void setName_Hotel(String name_Hotel) {
		Name_Hotel = name_Hotel;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getDecription() {
		return Decription;
	}
	public void setDecription(String decription) {
		Decription = decription;
	}
	public int getLandLord_id() {
		return LandLord_id;
	}
	public void setLandLord_id(int landLord_id) {
		LandLord_id = landLord_id;
	}
	@Override
	public String toString() {
		return "Hotels [Hotel_id=" + Hotel_id + ", Name_Hotel=" + Name_Hotel + ", Address=" + Address + ", Decription="
				+ Decription + ", LandLord_id=" + LandLord_id + "]";
	}
	
	
}


