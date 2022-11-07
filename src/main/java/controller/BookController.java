package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.CartDisplay;
import entity.Logins;
import entity.Users;

/**
 * Servlet implementation class BookController
 */
@WebServlet("/book")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		

		@SuppressWarnings("unchecked")
		List<CartDisplay> listCarts= (List<CartDisplay>) session.getAttribute("listCarts");
		List<CartDisplay> listCartsSelected = new ArrayList<>();
		for (CartDisplay y: listCarts) {
			String selected=request.getParameter(Integer.toString(y.getCart_id()));
			if(selected!=null) {
				listCartsSelected.add(new CartDisplay(y.getCart_id(), y.getCheckIn_date(), y.getCheckOut_date(), y.getTotal_rooms(), y.getName_hotel(), 
						y.getPrice_room(), y.getImage(), y.getType(), y.getAdult(), y.getChildren(), y.getUser_id(), y.getRoom_id(), y.getHotel_id(), y.getAvailable_Room(), y.getMax_Adult(), y.getMax_Children()));
			}
		}
		DAO dao = new DAO();
		Logins lg= (Logins) session.getAttribute("acc");
		Users user=dao.GetUsers(lg.getLogin_id());
//		for(CartDisplay y: listCartsSelected) {
//			System.out.println(y);
//		}
		session.setAttribute("listCartsSelected", listCartsSelected);
		session.setAttribute("user_book", user);
		request.getRequestDispatcher("HTML/book.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
