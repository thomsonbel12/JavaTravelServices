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
 * Servlet implementation class MyProfileController
 */
@WebServlet("/myprofile")
public class MyProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyProfileController() {
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
		DAO dao=new DAO();
		HttpSession session = request.getSession();
		Logins lg= (Logins) session.getAttribute("acc");
		Users user= dao.GetUsers(lg.getLogin_id());
		request.setAttribute("avatar_edit", user.getAvatar());
		request.setAttribute("name_edit", user.getName_user());
		request.setAttribute("email_edit", user.getEmail());
		request.setAttribute("phonenumber_edit", user.getPhone_number());
		request.setAttribute("password_edit", lg.getPassworld());
		request.getRequestDispatcher("/HTML/MyProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
