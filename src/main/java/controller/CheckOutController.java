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
 * Servlet implementation class CheckOutController
 */
@WebServlet("/checkout")
public class CheckOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutController() {
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
		
		HttpSession session = request.getSession();
		Users user= (Users) session.getAttribute("user_book");
		int userId = user.getUser_id();
		
		DAO dao = new DAO();
		String username = request.getParameter("user-name");
		String useremail = request.getParameter("user-email");
		String userphone = request.getParameter("user-phone");
			
		if(!username.equals(null) && !username.equals("")) {
			dao.EditName(username, userId);
		}else {
			request.setAttribute("nameerror", "nameerror");
		}
		
		if(!useremail.equals(null) && !useremail.equals("")) {
			dao.EditEmail(useremail, userId);
		}else {
			request.setAttribute("emailerror", "emailerror");
		}
		
		if(!userphone.equals(null) && !userphone.equals("")) {
			dao.EditPhoneNumber(userphone, userId);
		}else {
			request.setAttribute("phoneerror", "phoneerror");		
		}
		
		if(username.equals(null) || useremail.equals(null) || userphone.equals(null)
			|| username.equals("") || useremail.equals("") || userphone.equals("")
			) {
			request.getRequestDispatcher("HTML/book.jsp").forward(request, response);			
		}else {
			request.getRequestDispatcher("HTML/checkout.jsp").forward(request, response);
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
