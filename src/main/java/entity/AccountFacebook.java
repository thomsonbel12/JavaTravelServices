package entity;

public class AccountFacebook {
	private String id;
	private String name;
	public AccountFacebook() {
	}

	public AccountFacebook(String id,String name) {
		this.id=id;
		this.name=name;
	}	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return
				"AccountFacebook [id=" + this.id + ", name=" + this.name + "]";
	}
}
