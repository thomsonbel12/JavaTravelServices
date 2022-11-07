package entity;


public class DisplayHotelsBySearch {
	private int Hotel_id;
	private String Name_Hotel;
	private String Address;
	private String Decription;
	private int Price;
	private int LandLord_id;
	private String Image1;
	private String Image2;
	private String Image3;
	private String Image4;
	private String Image5;
	private String Benefit1;
	private String Benefit2;
	private String Benefit3;
	private String Benefit4;
	private String Benefit5;
	private String Benefit6;
	private String Benefit7;
	private String Benefit8;
	public DisplayHotelsBySearch() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DisplayHotelsBySearch(int Hotel_id, String Name_Hotel, String Address, String Decription,int Price, int LandLord_id,
			String Image1,String Image2, String Image3, String Image4, String Image5, String Benefit1,String Benefit2, String Benefit3,
			String Benefit4, String Benefit5, String Benefit6, String Benefit7,String Benefit8) {
		this.Hotel_id = Hotel_id;
		this.Name_Hotel = Name_Hotel;
		this.Address = Address;
		this.Decription = Decription;
		this.Price=Price;
		this.LandLord_id = LandLord_id;
		this.Image1=Image1;
		this.Image2=Image2;
		this.Image3=Image3;
		this.Image4=Image4;
		this.Image5=Image5;
		this.Benefit1=Benefit1;
		this.Benefit2=Benefit2;
		this.Benefit3=Benefit3;
		this.Benefit4=Benefit4;
		this.Benefit5=Benefit5;
		this.Benefit6=Benefit6;
		this.Benefit7=Benefit7;
		this.Benefit8=Benefit8;
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
	
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	
	
	public String getImage1() {
		return Image1;
	}
	public void setImage1(String image1) {
		Image1 = image1;
	}
	public String getImage2() {
		return Image2;
	}
	public void setImage2(String image2) {
		Image2 = image2;
	}
	public String getImage3() {
		return Image3;
	}
	public void setImage3(String image3) {
		Image3 = image3;
	}
	public String getImage4() {
		return Image4;
	}
	public void setImage4(String image4) {
		Image4 = image4;
	}
	public String getImage5() {
		return Image5;
	}
	public void setImage5(String image5) {
		Image5 = image5;
	}
	public String getBenefit1() {
		return Benefit1;
	}
	public void setBenefit1(String benefit1) {
		Benefit1 = benefit1;
	}
	public String getBenefit2() {
		return Benefit2;
	}
	public void setBenefit2(String benefit2) {
		Benefit2 = benefit2;
	}
	public String getBenefit3() {
		return Benefit3;
	}
	public void setBenefit3(String benefit3) {
		Benefit3 = benefit3;
	}
	public String getBenefit4() {
		return Benefit4;
	}
	public void setBenefit4(String benefit4) {
		Benefit4 = benefit4;
	}
	public String getBenefit5() {
		return Benefit5;
	}
	public void setBenefit5(String benefit5) {
		Benefit5 = benefit5;
	}
	public String getBenefit6() {
		return Benefit6;
	}
	public void setBenefit6(String benefit6) {
		Benefit6 = benefit6;
	}
	public String getBenefit7() {
		return Benefit7;
	}
	public void setBenefit7(String benefit7) {
		Benefit7 = benefit7;
	}
	public String getBenefit8() {
		return Benefit8;
	}
	public void setBenefit8(String benefit8) {
		Benefit8 = benefit8;
	}
	@Override
	public String toString() {
		return "DisplayHotelsBySearch [Hotel_id=" + Hotel_id + ", Name_Hotel=" + Name_Hotel + ", Address=" + Address
				+ ", Decription=" + Decription + ", Price=" + Price + ", LandLord_id=" + LandLord_id + ", Image1="
				+ Image1 + ", Image2=" + Image2 + ", Image3=" + Image3 + ", Image4=" + Image4 + ", Image5=" + Image5
				+ ", Benefit1=" + Benefit1 + ", Benefit2=" + Benefit2 + ", Benefit3=" + Benefit3 + ", Benefit4="
				+ Benefit4 + ", Benefit5=" + Benefit5 + ", Benefit6=" + Benefit6 + ", Benefit7=" + Benefit7
				+ ", Benefit8=" + Benefit8 + "]";
	}
	
}


