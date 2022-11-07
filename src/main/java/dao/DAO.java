package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import connect.DBContext;
import entity.Logins;
import entity.Rooms;
import entity.Users;
import entity.Benefits;
import entity.CartDisplay;
import entity.Carts;
import entity.DisplayHotels;
import entity.DisplayHotelsBySearch;
import entity.Hotels;
import entity.Images;

public class DAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public Logins GetLogin(String User_name, String Passworld, String Type, String Role) {
		String query = "select * from Logins where [User_name]=? and [Passworld]=? and [Login_type]=? and [Role]=?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, User_name);
			ps.setString(2, Passworld);
			ps.setString(3, Type);
			ps.setString(4, Role);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Logins(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			}
		} catch (Exception e) {
		}
		return null;
	}

	public Logins GetLoginByEmail(String User_name, String Type, String Role) {
		String query = "select * from Logins where [User_name]=? and [Login_type]=? and [Role]=?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, User_name);
			ps.setString(2, Type);
			ps.setString(3, Role);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Logins(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			}
		} catch (Exception e) {
		}
		return null;
	}

	public Logins GetLoginByPhone(String User_name, String Type, String Role) {
		String query = "select * from Logins where [User_name]=? and [Login_type]=? and [Role]=?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, User_name);
			ps.setString(2, Type);
			ps.setString(3, Role);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Logins(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			}
		} catch (Exception e) {
		}
		return null;
	}

	public Users GetUsers(int User_id) {
		String query = "select * from Users where [User_id]=?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, User_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Users(rs.getInt(1), rs.getString(2), rs.getString(5), rs.getString(4), rs.getString(3));
			}
		} catch (Exception e) {

		}
		return null;
	}

	public Hotels GetHotels(int Hotel_id) {
		String query = "select * from Hotels where Hotel_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, Hotel_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Hotels(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public Carts GetCartsByUserId(int User_id) {
		String query = "select * from Carts where User_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, User_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Carts();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public DisplayHotels getHotelsByHotelId(int Hotel_id) {
		String query = "select * from Hotels where Hotel_id = ?";
		String query1 = "SELECT TOP 1 * FROM [Images] WHERE [Hotel_id]=?;";
		String query2 = "SELECT MIN(Price) MIN_LUONG FROM Rooms WHERE [Hotel_id]=?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, Hotel_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				PreparedStatement ps1 = null;
				ResultSet rs1 = null;
				PreparedStatement ps2 = null;
				ResultSet rs2 = null;
				ps1 = conn.prepareStatement(query1);
				ps1.setInt(1, rs.getInt(1));
				rs1 = ps1.executeQuery();

				ps2 = conn.prepareStatement(query2);
				ps2.setInt(1, rs.getInt(1));
				rs2 = ps2.executeQuery();
				while (rs1.next() && rs2.next())
					return new DisplayHotels(rs.getInt(1), rs.getString(2), rs1.getString(2), rs.getString(3),
							rs.getString(4), rs2.getInt(1), rs.getInt(5));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;

	}

	public void EditName(String Name, int User_id) {
		String query = "UPDATE [Users] SET Name_User =? WHERE User_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, Name);
			ps.setInt(2, User_id);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void EditEmail(String Email, int User_id) {
		String query = "UPDATE [Users] SET [Email] =? WHERE User_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, Email);
			ps.setInt(2, User_id);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void EditPhoneNumber(String phone, int User_id) {
		String query = "UPDATE [Users] SET [Phone_number] =? WHERE User_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, phone);
			ps.setInt(2, User_id);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void EditPassword(String pass, int Login_id) {
		String query = "UPDATE [Logins] SET Passworld =? WHERE [Login_id]=?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, pass);
			ps.setInt(2, Login_id);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void UpdateImage(String Image, int User_id) {
		String query = "UPDATE [Users] SET Avatar =? WHERE User_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, Image);
			ps.setInt(2, User_id);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void UpdatePasswordByMail(String pass, String email) {
		String query = "UPDATE [Logins] SET Passworld =? WHERE [User_name]=? and [Login_type]='email' and [Role]='user'";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, pass);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void UpdatePasswordByPhone(String pass, String phone) {
		String query = "UPDATE [Logins] SET Passworld =? WHERE [User_name]=? and [Login_type]='sdt' and [Role]='user'";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, pass);
			ps.setString(2, phone);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}


	
	public Logins CheckLoginGoogle(String email) {
		String query = "select * from Logins where [User_name]=? and [Login_type]='google'";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Logins(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			}
		} catch (Exception e) {
		}
		return null;
	}

	public Logins CheckLoginFacebook(String ID) {
		String query = "select * from Logins where [User_name]=? and [Login_type]='facebook'";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, ID);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Logins(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			}
		} catch (Exception e) {
		}
		return null;
	}

	public Logins Insert_Login(String user_name, String login_type, String role, String pass) {
		String query = "INSERT INTO dbo.Logins([User_name], [Login_type], [Role],[Passworld]) VALUES(?,?,?,?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user_name);
			ps.setString(2, login_type);
			ps.setString(3, role);
			ps.setString(4, pass);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public void Insert_User(int user_id, String Name_user, String avatar, String phone) {
		String query = "INSERT INTO dbo.Users([User_id], [Name_User],[Avatar], [Phone_number]) VALUES(?,?,?,?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			ps.setString(2, Name_user);
			ps.setString(3, avatar);
			ps.setString(4, phone);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void Insert_Bill(int Total, String Datee, int Total_rooms,String Payment_Method, int User_id ) {
		String query = "insert into Bills (Total, [Date], Total_rooms, Payment_Method , [User_id])\r\n"
				+ "	values (?,?,?,?,?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, Total);
			System.out.println("Datee"+Datee);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		    DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		    String newDate = LocalDate.parse(Datee, formatter).format(formatter2);
		    
			ps.setString(2, newDate);
 			System.out.println("newDate"+newDate);
			ps.setInt(3, Total_rooms);
			ps.setString(4, Payment_Method);
			ps.setInt(5, User_id);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void Insert_Bill_Detail(String CheckIn_date, String CheckOut_date, int Total_rooms, 
									int Total_money, int Adult, int Children, int Room_id, int Bill_id) {
		System.out.println("??");
		System.out.println(CheckIn_date);
		System.out.println(CheckOut_date);
		System.out.println(Total_rooms);
		System.out.println(Total_money);
		System.out.println(Adult);
		System.out.println(Children);
		System.out.println(Room_id);
		System.out.println(Bill_id);
		System.out.println("??");
		String query = "insert into Bill_Detail(CheckIn_date, CheckOut_date, \r\n"
				+ "				Total_rooms, Total_money,\r\n"
				+ "				Adult, Children, Room_id, Bill_id)\r\n"
				+ "	values (?,?,?,?,?,?,?,?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);    
			ps.setString(1, CheckIn_date);
			ps.setString(2, CheckOut_date);
			ps.setInt(3, Total_rooms);
			ps.setInt(4, Total_money);
			ps.setInt(5, Adult);
			ps.setInt(6, Children);
			ps.setInt(7, Room_id);
			ps.setInt(8, Bill_id);
			System.out.println("done");
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void DeleteCart(int Cart_id) {
		String query = "DELETE from Carts where Cart_id=?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, Cart_id);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public List<DisplayHotels> getAllHotels() {
		List<DisplayHotels> list = new ArrayList<>();
		String query = "select * from Hotels;";
		String query1 = "SELECT TOP 1 * FROM [Images] WHERE [Hotel_id]=?;";
		String query2 = "SELECT MIN(Price) MIN_LUONG FROM Rooms WHERE [Hotel_id]=?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				PreparedStatement ps1 = null;
				ResultSet rs1 = null;
				PreparedStatement ps2 = null;
				ResultSet rs2 = null;
				ps1 = conn.prepareStatement(query1);
				ps1.setInt(1, rs.getInt(1));
				rs1 = ps1.executeQuery();

				ps2 = conn.prepareStatement(query2);
				ps2.setInt(1, rs.getInt(1));
				rs2 = ps2.executeQuery();
				while (rs1.next() && rs2.next())
					list.add(new DisplayHotels(rs.getInt(1), rs.getString(2), rs1.getString(2), rs.getString(3),
							rs.getString(4), rs2.getInt(1), rs.getInt(5)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;

	}

	public List<DisplayHotels> getAllHotelsByCity(String address) {
		List<DisplayHotels> list = new ArrayList<>();
		String City = null;
		if (address.equals("hn"))
			City = "%Hà Nội%";
		else if (address.equals("hcm"))
			City = "%Hồ Chí Minh%";
		else if (address.equals("dn"))
			City = "%Đà Nẵng%";
		else if (address.equals("vt"))
			City = "%Vũng Tàu%";
		else if (address.equals("dl"))
			City = "%Đà Lạt%";
		String query = "SELECT * FROM dbo.Hotels WHERE [Address] LIKE ?";
		String query1 = "SELECT TOP 1 * FROM [Images] WHERE [Hotel_id]=?;";
		String query2 = "SELECT MIN(Price) MIN_PRICE FROM Rooms WHERE [Hotel_id]=?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, City);
			rs = ps.executeQuery();
			while (rs.next()) {
				PreparedStatement ps1 = null;
				ResultSet rs1 = null;
				PreparedStatement ps2 = null;
				ResultSet rs2 = null;

				ps1 = conn.prepareStatement(query1);
				ps1.setInt(1, rs.getInt(1));
				rs1 = ps1.executeQuery();

				ps2 = conn.prepareStatement(query2);
				ps2.setInt(1, rs.getInt(1));
				rs2 = ps2.executeQuery();
				while (rs1.next() && rs2.next())
					list.add(new DisplayHotels(rs.getInt(1), rs.getString(2), rs1.getString(2), rs.getString(3),
							rs.getString(4), rs2.getInt(1), rs.getInt(5)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;

	}

	public List<DisplayHotelsBySearch> getAllHotelsBySearch(String Search1) {
		List<DisplayHotelsBySearch> list = new ArrayList<>();
		String Search = "%" + Search1 + "%";
		String query = "Select * from [Hotels] where [Address] like ?  or Name_Hotel like ? ";
		String query1 = "SELECT TOP 5 * FROM [Images] WHERE [Hotel_id]=?;";
		String query2 = "SELECT MIN(Price) MIN_PRICE FROM Rooms WHERE [Hotel_id]=?";
		String query3 = "SELECT TOP 8 * FROM [Benefits] WHERE [Hotel_id]=?;";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, Search);
			ps.setString(2, Search);
			rs = ps.executeQuery();
			while (rs.next()) {
				PreparedStatement ps1 = null;
				ResultSet rs1 = null;
				PreparedStatement ps2 = null;
				ResultSet rs2 = null;
				PreparedStatement ps3 = null;
				ResultSet rs3 = null;
				ps1 = conn.prepareStatement(query1);
				ps1.setInt(1, rs.getInt(1));
				rs1 = ps1.executeQuery();

				ps2 = conn.prepareStatement(query2);
				ps2.setInt(1, rs.getInt(1));
				rs2 = ps2.executeQuery();

				ps3 = conn.prepareStatement(query3);
				ps3.setInt(1, rs.getInt(1));
				rs3 = ps3.executeQuery();

				String[] arrImg = new String[] { null, null, null, null, null };
				int i = 0;
				while (rs1.next()) {
					arrImg[i] = rs1.getString(2);
					i++;
				}
				String[] arrBene = new String[8];
				i = 0;
				while (rs3.next()) {
					arrBene[i] = rs3.getString(2);
					i++;
				}
				while (rs2.next())
					list.add(new DisplayHotelsBySearch(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
							rs2.getInt(1), rs.getInt(5), arrImg[0], arrImg[1], arrImg[2], arrImg[3], arrImg[4],
							arrBene[0], arrBene[1], arrBene[2], arrBene[3], arrBene[4], arrBene[5], arrBene[6],
							arrBene[7]));

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;

	}

	public List<CartDisplay> getAllCartsByUserId(int User_id) {
		List<CartDisplay> list = new ArrayList<>();
		String query = "select * from Carts where User_id = ?";
		String query1 = "select h.Name_Hotel from Rooms r join Hotels h on r.Hotel_id = h.Hotel_id where Room_id = ?";
		String query2 = "SELECT Price, Available_Room, Adult, Children  FROM Rooms WHERE [Room_id]=?";
		String query3 = "SELECT TOP 1 * FROM [Images] WHERE [Room_id]=?;";
		String query4 = "SELECT Type, Hotel_id FROM Rooms WHERE [Room_id]=?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, User_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				PreparedStatement ps1 = null;
				ResultSet rs1 = null;
				PreparedStatement ps2 = null;
				ResultSet rs2 = null;
				PreparedStatement ps3 = null;
				ResultSet rs3 = null;
				PreparedStatement ps4 = null;
				ResultSet rs4 = null;
				ps1 = conn.prepareStatement(query1);
				ps1.setInt(1, rs.getInt(8));
				rs1 = ps1.executeQuery();

				ps2 = conn.prepareStatement(query2);
				ps2.setInt(1, rs.getInt(8));
				rs2 = ps2.executeQuery();

				ps3 = conn.prepareStatement(query3);
				ps3.setInt(1, rs.getInt(8));
				rs3 = ps3.executeQuery();
				
				ps4 = conn.prepareStatement(query4);
				ps4.setInt(1, rs.getInt(8));
				rs4 = ps4.executeQuery();
				while (rs1.next() && rs2.next() && rs3.next() &&rs4.next())
					list.add(new CartDisplay(rs.getInt(1), rs.getDate(2), rs.getDate(3), rs.getInt(4), rs1.getString(1),
							rs2.getInt(1), rs3.getString(2), rs4.getString(1), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs4.getInt(2), rs2.getInt(2), rs2.getInt(3), rs2.getInt(4)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;

	}

	public List<Rooms> getAllRoomByHotelId(int hotel_ID) {
		List<Rooms> list = new ArrayList<>();
		String query = "select * from Rooms where Hotel_id = ?";
		String query1 = "SELECT TOP 1 * FROM [Images] WHERE [Room_id]=?;";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, hotel_ID);
			rs = ps.executeQuery();
			while (rs.next()) {
				PreparedStatement ps1 = null;
				ResultSet rs1 = null;

				ps1 = conn.prepareStatement(query1);
				ps1.setInt(1, rs.getInt(1));
				rs1 = ps1.executeQuery();
				while (rs1.next())
					list.add(new Rooms(rs.getInt(1), rs.getString(2), rs1.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5),
							rs.getInt(6), rs.getInt(7)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public List<Benefits> GetAllBenefitsByHotelId(int Hotel_ID) {
		List<Benefits> list = new ArrayList<>();
		String query = "select * from Benefits where Hotel_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, Hotel_ID);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Benefits(rs.getInt(1), rs.getString(2), rs.getInt(3)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public List<Images> GetFiveImagesByHotelId(int Hotel_id) {
		List<Images> list = new ArrayList<>();
		String query = "select top 5 * from Images where Hotel_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, Hotel_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Images(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	
	public String AddZero(String number) {
		if(number.length()==1) {
			number = "0" + number;
		}
		return number;		
	}
	
	public int Last_Bill_Id() {
		String query = "select top 1* from Bills order by Bill_id desc";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1) ;
			}
		} catch (Exception e) {

		}
		return 0;
	}
}
