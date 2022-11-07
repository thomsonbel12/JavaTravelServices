package entity;

public class DisplayHotels {
	private int Hotel_id;
	private String Name_Hotel;
	private String Image;
	private String Address;
	private String Decription;
	private int Price;
	private int LandLord_id;
	public DisplayHotels() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DisplayHotels(int Hotel_id, String Name_Hotel, String Image, String Address, String Decription,int Price, int LandLord_id) {
		this.Hotel_id = Hotel_id;
		this.Name_Hotel = Name_Hotel;
		this.Image=Image;
		this.Address = Address;
		this.Decription = Decription;
		this.Price=Price;
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
	
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	@Override
	public String toString() {
		return "DisplayHotels [Hotel_id=" + this.Hotel_id + ", Name_Hotel=" + Name_Hotel + ", Image=" + Image + ", Address="
				+ Address + ", Decription=" + Decription + ", Price=" + Price + ", LandLord_id=" + LandLord_id + "]";
	}
	
}


