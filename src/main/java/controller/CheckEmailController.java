package controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Logins;

/**
 * Servlet implementation class CheckEmailController
 */
@WebServlet("/checkemail")
public class CheckEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("emailCheck", null);
		session.setAttribute("resetPass", null);
		session.setAttribute("codeCheck", null);
		request.getRequestDispatcher("/HTML/ForgetPasswordEmail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String email=request.getParameter("email_login");
		DAO dao=new DAO();
		Logins a= dao.GetLoginByEmail(email, "email", "user");
		if(a==null) {
			session.setAttribute("error1", "Email không hợp lệ vui lòng kiểm tra lại.");
			request.getRequestDispatcher("/HTML/ForgetPasswordEmail.jsp").forward(request, response);
		}
		else 
		{
			session.setAttribute("email1", email);
			session.setAttribute("HoTen", a.getUser_name());
			response.sendRedirect("/ProjectTravelServices/sendcode");
		}
	}
}
