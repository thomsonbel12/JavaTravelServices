package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.CartDisplay;
import entity.DisplayHotels;
import entity.Logins;

@WebServlet(urlPatterns = { "/home" })
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3470182742494703974L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
//		SendEmail.main();
		HttpSession session = request.getSession();
		DAO dao = new DAO();
		
		
		Cookie arrLogin[] = request.getCookies();
		int Login_id =0 ;
		String User_name = null;
		String Login_type = null;
		String Role = null;
		String Passworld = null;
		for (Cookie o : arrLogin) {

//			response.addCookie(ckLogin_id);
//			response.addCookie(ckUser_name);
//			response.addCookie(ckLogin_type);
//			response.addCookie(ckRole);
//			response.addCookie(ckPassworld);

			if (o.getName().equals("ckLogin_id")) {
				Login_id = Integer.parseInt(o.getValue());
			}
			if (o.getName().equals("ckUser_name")) {
				User_name = o.getValue();
			}
			if (o.getName().equals("ckLogin_type")) {
				Login_type = o.getValue();
			}
			if (o.getName().equals("ckRole")) {
				Role = o.getValue();
			}
			if (o.getName().equals("ckPassworld")) {
				Passworld = o.getValue();
			}
		}
		for (Cookie o : arrLogin) {
			if (o.getName().equals("ckPassworld")) {
				List<CartDisplay> listCarts= dao.getAllCartsByUserId(Login_id);
				session.setAttribute("listCarts", listCarts);
//				for(CartDisplay y: listCarts)
//					System.out.println(y);
				Logins a = new Logins(Login_id, User_name, Login_type, Role, Passworld);
				session.setAttribute("acc", a);
				
			}
		}
		
		session.setAttribute("displayed_email", "display : none;");
		RequestDispatcher rq = request.getRequestDispatcher("/HTML/home.jsp");
		rq.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
}
