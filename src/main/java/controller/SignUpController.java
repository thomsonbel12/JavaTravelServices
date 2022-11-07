package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Logins;

/**
 * Servlet implementation class SignUpController
 */
@WebServlet("/signup")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/HTML/dangKi.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String avatar = "https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png";
		HttpSession session = request.getSession();
		session.setAttribute("displayed_email", "display : none;");
		String fullname_email=request.getParameter("fullname_email");
		String fullname_phone=request.getParameter("fullname_phone");
		String email_signup=request.getParameter("email_signup");
		String phone_signup=request.getParameter("phone_signup");
		String pass_email_signup=request.getParameter("pass_email_signup");
		String repass_email_signup=request.getParameter("repass_email_signup");
		String pass_phone_signup=request.getParameter("pass_phone_signup");
		String repass_phone_signup=request.getParameter("repass_phone_signup");
		
		
		DAO dao=new DAO();
		Logins a;
		if(phone_signup==null) {
			if(!pass_email_signup.equals(repass_email_signup)) {
				request.setAttribute("displayed_signup_email", "display : flex;");
				request.setAttribute("mess_signup_email", "Mật khẩu không trùng khớp.");
				request.getRequestDispatcher("/HTML/dangKi.jsp").forward(request, response);
			}
			else {
				a=dao.GetLogin(email_signup,pass_email_signup,"email","user");
				if(a!=null) {
					request.setAttribute("displayed_signup_email", "display : flex;");
					request.setAttribute("mess_signup_email", "Địa chỉ email đã được đăng ký trước đó.");
					request.getRequestDispatcher("/HTML/dangKi.jsp").forward(request, response);	
				}
				else {
					dao.Insert_Login(email_signup, "email", "user", pass_email_signup);
					Logins lg=dao.GetLogin(email_signup, pass_email_signup, "email", "user");
					dao.Insert_User(lg.getLogin_id(), fullname_email, avatar, null);
					
					response.sendRedirect("/ProjectTravelServices/login");
				}
			}
		}
		else {
			if(!pass_phone_signup.equals(repass_phone_signup)) {
				request.setAttribute("displayed_signup_phone", "display : flex;");
				request.setAttribute("mess_signup_phone", "Mật khẩu không trùng khớp.");
				request.getRequestDispatcher("/HTML/dangKi.jsp").forward(request, response);
				}
			else {
				a=dao.GetLogin(phone_signup, pass_phone_signup,"sdt", "user");
				if(a!=null) 
				{
					request.setAttribute("displayed_signup_phone", "display : flex;");
					request.setAttribute("mess_signup_phone", "Số điện thoại đã được đăng ký trước đó.");
					request.getRequestDispatcher("/HTML/dangKi.jsp").forward(request, response);
				}
				else {
					dao.Insert_Login(phone_signup, "sdt", "user",pass_phone_signup);
					Logins lg=dao.GetLogin(phone_signup,pass_phone_signup,"sdt","user");
					dao.Insert_User(lg.getLogin_id(), fullname_phone, avatar, phone_signup);
					response.sendRedirect("/ProjectTravelServices/login");
				}
			}
		}
	}

}

