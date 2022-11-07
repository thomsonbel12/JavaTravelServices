package entity;

public class Benefits {
	private int Benefit_id;
	private String Benefit_name;
	private int Hotel_id;
	
	
	public Benefits() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Benefits(int Benefit_id, String Benefit_name, int Hotel_id) {
		this.Benefit_id = Benefit_id;
		this.Benefit_name = Benefit_name;
		this.Hotel_id = Hotel_id;
	}


	public int getBenefit_id() {
		return Benefit_id;
	}


	public void setBenefit_id(int benefit_id) {
		Benefit_id = benefit_id;
	}


	public String getBenefit_name() {
		return Benefit_name;
	}


	public void setBenefit_name(String benefit_name) {
		Benefit_name = benefit_name;
	}


	public int getHotel_id() {
		return Hotel_id;
	}


	public void setHotel_id(int hotel_id) {
		Hotel_id = hotel_id;
	}


	@Override
	public String toString() {
		return "Benefits [Benefit_id=" + Benefit_id + ", Benefit_name=" + Benefit_name + ", Hotel_id=" + Hotel_id + "]";
	}
	
	
}
