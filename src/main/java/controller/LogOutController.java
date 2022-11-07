package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOutController
 */
@WebServlet(urlPatterns = {"/logout"})
public class LogOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogOutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.removeAttribute("acc");
		
		Cookie ckLogin_id = new Cookie("ckLogin_id", null);
		Cookie ckUser_name =  new Cookie("ckUser_name", null);
		Cookie ckLogin_type= new Cookie("ckLogin_type", null);
		Cookie ckRole = new Cookie("ckRole", null);
		Cookie ckPassworld= new Cookie("ckPassworld", null);
		ckUser_name.setMaxAge(0);
		ckLogin_id.setMaxAge(0);
		ckLogin_type.setMaxAge(0);
		ckRole.setMaxAge(0);
		ckPassworld.setMaxAge(0);
		response.addCookie(ckLogin_id);
		response.addCookie(ckUser_name);
		response.addCookie(ckLogin_type);
		response.addCookie(ckRole);
		response.addCookie(ckPassworld);
		
		response.sendRedirect("/ProjectTravelServices/home");
		
//		request.getRequestDispatcher("/home").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
