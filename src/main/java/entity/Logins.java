package entity;

public class Logins {
	private int Login_id;
	private String User_name;
	private String Login_type;
	private String Role;
	private String Passworld;
	public Logins() {
		super();
	}
	public Logins(int Login_id, String User_name, String Login_type,String Role, String Passworld)  {
		this.Login_id=Login_id;
		this.User_name=User_name;
		this.Login_type=Login_type;
		this.Role=Role;
		this.Passworld=Passworld;
	}
	public int getLogin_id() {
		return Login_id;
	}
	public String getLogin_type() {
		return Login_type;
	}
	public String getPassworld() {
		return Passworld;
	}
	public String getRole() {
		return Role;
	}
	public String getUser_name() {
		return User_name;
	}
	public void setLogin_id(int login_id) {
		Login_id = login_id;
	}
	public void setLogin_type(String login_type) {
		Login_type = login_type;
	}
	public void setPassworld(String passworld) {
		Passworld = passworld;
	}
	public void setRole(String role) {
		Role = role;
	}
	public void setUser_name(String user_name) {
		User_name = user_name;
	}
	
	
	@Override
	public String toString() {
		return "Logins [Login_id=" + Login_id + ", User_name=" + User_name + ", Login_type=" + Login_type + ", Role="
				+ Role + ", Passworld=" + Passworld + "]";
	}
}

