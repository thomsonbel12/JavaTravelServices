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
import entity.Users;

/**
 * Servlet implementation class EditPhoneNumberController
 */
@WebServlet("/editphonenumber")
public class EditPhoneNumberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPhoneNumberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String new_phonenumber=request.getParameter("new_phonenumber");
		if(new_phonenumber.equals(null)) {
			request.setAttribute("err_newname", "Vui lòng nhập thông tin trước khi thực hiện thao tác");
			System.out.println("Vui lòng nhập thông tin trước khi thực hiện thao tác");
		}
		else {
			DAO dao=new DAO();
			HttpSession session = request.getSession();
			Logins lg= (Logins) session.getAttribute("acc");
			Users user= dao.GetUsers(lg.getLogin_id());
			dao.EditPhoneNumber(new_phonenumber, user.getUser_id());
			response.sendRedirect("/ProjectTravelServices/myprofile");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
