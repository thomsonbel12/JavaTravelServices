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
 * Servlet implementation class CheckPhoneController
 */
@WebServlet("/checkphone")
public class CheckPhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPhoneController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("phoneCheck", null);
		session.setAttribute("resetPassPhone", null);
		session.setAttribute("codeCheckPhone", null);
		request.getRequestDispatcher("/HTML/ForgetPasswordPhone.jsp").forward(request, response);
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
		String phone=request.getParameter("phone_login");
		DAO dao=new DAO();
		Logins a= dao.GetLoginByEmail(phone, "sdt", "user");
		System.out.println(a);
		if(a==null) {
			session.setAttribute("errorphone1", "Số điện thoại không hợp lệ vui lòng kiểm tra lại.");
			request.getRequestDispatcher("/HTML/ForgetPasswordPhone.jsp").forward(request, response);
		}
		else 
		{
			session.setAttribute("errorphone1", null);
			session.setAttribute("phone1", phone);
			session.setAttribute("HoTenByPhone", a.getUser_name());
			response.sendRedirect("/ProjectTravelServices/sendcodephone");
		}
	}

}
