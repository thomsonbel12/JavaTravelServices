package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Logins;
import entity.Users;

@WebServlet(urlPatterns="/login")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = -1591444818940832891L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("displayed_email", "display : none;");
		Cookie arrLogin[] = request.getCookies();
		for(Cookie o: arrLogin) {
			if(o.getName().equals("User_login_email")) {
				request.setAttribute("emailLogin", o.getValue());
			}
			if(o.getName().equals("password_email")) {
				request.setAttribute("passEmailLogin", o.getValue());
			}
			if(o.getName().equals("User_login_phone")) {
				request.setAttribute("phoneLogin", o.getValue());
			}
			if(o.getName().equals("password_phone")) {
				request.setAttribute("passPhoneLogin", o.getValue());
			}
		}
		request.getRequestDispatcher("/HTML/dangNhap.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//Xử lí đăng nhập bằng email mặc định	
		String email=request.getParameter("email");
		String pass_email=request.getParameter("pass-email");
		String remember=request.getParameter("remember");
		String phone=request.getParameter("phone");
		String pass_phone=request.getParameter("pass-phone");
		if(phone==null && pass_phone==null) {
			DAO login_email=new DAO();
			Logins a=login_email.GetLogin(email, pass_email,"email","user");
			if(a!=null)
			{
				Users user=login_email.GetUsers(a.getLogin_id());
				session.setAttribute("avatar", user.getAvatar());
				session.setAttribute("displayed_email", "display : none;");
				session.setAttribute("acc", a);
				session.setAttribute("idlogin", a.getLogin_id());
//				List<DisplayHotels> list = login_email.getAllHotelsByCity("hn");
//				for(DisplayHotels o: list) {
//					System.out.println(o);
//				}
				Cookie ckLogin_id = new Cookie("ckLogin_id", Integer.toString(a.getLogin_id()) );
				Cookie ckUser_name =  new Cookie("ckUser_name", a.getUser_name());
				Cookie ckLogin_type= new Cookie("ckLogin_type", a.getLogin_type());
				Cookie ckRole = new Cookie("ckRole", a.getRole());
				Cookie ckPassworld= new Cookie("ckPassworld", a.getPassworld());
				Cookie um = new Cookie("User_login_email", email);
				Cookie pm = new Cookie("password_email", pass_email);
				um.setMaxAge(60*60*24);
				if(remember!=null) {
					pm.setMaxAge(60);
					ckUser_name.setMaxAge(60*60*24);
					ckLogin_id.setMaxAge(60*60*24);
					ckLogin_type.setMaxAge(60*60*24);
					ckRole.setMaxAge(60);
					ckPassworld.setMaxAge(60*60*24);
				}
				else {
					pm.setMaxAge(0);
				}
				response.addCookie(um);
				response.addCookie(pm);
				response.addCookie(ckLogin_id);
				response.addCookie(ckUser_name);
				response.addCookie(ckLogin_type);
				response.addCookie(ckRole);
				response.addCookie(ckPassworld);
				response.sendRedirect("/ProjectTravelServices/home");
				
			}
			else {
				session.setAttribute("displayed_email", "display : flex;");
				request.setAttribute("mess", "Địa chỉ email hoặc mật khẩu không đúng.");
				request.getRequestDispatcher("/HTML/dangNhap.jsp").forward(request, response);
			}
		}
		else {
			//Xử lí đăng nhập bằng số điện thoại mặc định
			DAO login_phone=new DAO();
			Logins b=login_phone.GetLogin(phone, pass_phone,"sdt","user");

			if(b!=null)
			{
				
				DAO u=new DAO();
				Users user=u.GetUsers(b.getLogin_id());
				session.setAttribute("avatar",user.getAvatar());
				Cookie ckLogin_id = new Cookie("ckLogin_id", Integer.toString(b.getLogin_id()) );
				Cookie ckUser_name =  new Cookie("ckUser_name", b.getUser_name());
				Cookie ckLogin_type= new Cookie("ckLogin_type", b.getLogin_type());
				Cookie ckRole = new Cookie("ckRole", b.getRole());
				Cookie ckPassworld= new Cookie("ckPassworld", b.getPassworld());
				Cookie up = new Cookie("User_login_phone", phone);
				Cookie pp = new Cookie("password_phone", pass_phone);
				up.setMaxAge(60*60*24);
				if(remember!=null) {
					pp.setMaxAge(60*60*24);
					ckUser_name.setMaxAge(60*60*24);
					ckLogin_id.setMaxAge(60*60*24);
					ckLogin_type.setMaxAge(60*60*24);
					ckRole.setMaxAge(60);
					ckPassworld.setMaxAge(60*60*24);
				}
				else {
					pp.setMaxAge(0);
				}
				response.addCookie(up);
				response.addCookie(pp);
				response.addCookie(ckLogin_id);
				response.addCookie(ckUser_name);
				response.addCookie(ckLogin_type);
				response.addCookie(ckRole);
				response.addCookie(ckPassworld);
				session.setAttribute("displayed_email", "display : none;");
				session.setAttribute("acc", b);
				response.sendRedirect("/ProjectTravelServices/home");
			}
			else {
				session.setAttribute("displayed_email", "display : flex;");
				session.setAttribute("mess", "Số điện thoại hoặc mật khẩu không đúng.");
				request.getRequestDispatcher("/HTML/dangNhap.jsp").forward(request, response);
			}
		}


	}
}
