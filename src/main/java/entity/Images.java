package entity;

public class Images {
	private int Image_id;
	private String Url_image;
	private int Room_id;
	private int Hotel_id;
	public Images() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Images(int Image_id, String Url_image, int Room_id, int Hotel_id) {
		this.Image_id = Image_id;
		this.Url_image = Url_image;
		this.Room_id = Room_id;
		this.Hotel_id = Hotel_id;
	}
	public int getImage_id() {
		return Image_id;
	}
	public void setImage_id(int image_id) {
		Image_id = image_id;
	}
	public String getUrl_image() {
		return Url_image;
	}
	public void setUrl_image(String url_image) {
		Url_image = url_image;
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
	@Override
	public String toString() {
		return "Images [Image_id=" + Image_id + ", Url_image=" + Url_image + ", Room_id=" + Room_id + ", Hotel_id="
				+ Hotel_id + "]";
	}
	
}
