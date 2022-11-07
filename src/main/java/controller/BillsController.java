package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
 * Servlet implementation class BillsController
 */
@WebServlet(urlPatterns = {"/Bills", "/bills"})
public class BillsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BillsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DAO dao = new DAO();
		int Total = Integer.parseInt((request.getParameter("total_money_pass")));
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
			LocalDateTime now = LocalDateTime.now();
			
		String Date = dao.AddZero(Integer.toString(now.getDayOfMonth())) + "-" 
			+ dao.AddZero(Integer.toString(now.getMonthValue()) + "-" 
				+ now.getYear());
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<CartDisplay> listCartsSelected= (List<CartDisplay>) session.getAttribute("listCartsSelected");
		int TotalRoom = 0;
		for(CartDisplay c : listCartsSelected) {
			TotalRoom = TotalRoom + c.getTotal_rooms();
		}
			
		String direct_payment_check = request.getParameter("direct_payment_check");
		if(direct_payment_check != null) {
			direct_payment_check = "1" ; // Thanh toan khi nhan hang
		}
		else {
			direct_payment_check = "2" ; // Thanh toan qua MOMO
		}
		Logins lg= (Logins) session.getAttribute("acc");
		Users user = dao.GetUsers(lg.getLogin_id());
		int user_Id = user.getUser_id();
		
		dao.Insert_Bill(Total, Date, TotalRoom,direct_payment_check, user_Id);
		
		int Last_Bill_Id = dao.Last_Bill_Id();
		
		for(CartDisplay c : listCartsSelected) {
			dao.Insert_Bill_Detail(c.getCheckIn_date().toString(), c.getCheckOut_date().toString(), 
					c.getTotal_rooms(), Total, c.getAdult(), c.getChildren(), 
					c.getRoom_id(), Last_Bill_Id);
			dao.DeleteCart(c.getCart_id());	
		}
		response.sendRedirect("/ProjectTravelServices/home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
