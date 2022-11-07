package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import entity.DisplayHotels;

/**
 * Servlet implementation class CityController
 */
@WebServlet("/city")
public class CityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CityController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String cityID = request.getParameter("cid"); 
		DAO dao = new DAO();
		List<DisplayHotels> list = dao.getAllHotelsByCity(cityID);
		PrintWriter out = response.getWriter();
		for(DisplayHotels o: list) {
			out.print("<div class=\"box-hotel\" id=\"box-list\">\r\n"
					+ "						<a href=\"room?hotelID="+o.getHotel_id()+"\" style=\"cursor: pointer; min-height: 260px; display: flex; flex-direction: column; justify-content: space-between; padding: 12px; border-radius: 10px;\">\r\n"
					+ "							<img style=\"border: 1px solid #ddd; border-radius: 4px; padding: 5px; width: 100%; object-fit: cover; height: 150px;\" src=\""+o.getImage()+"\">\r\n"
					+ "							<div style=\"font-size: medium; width: 100%;\">\r\n"
					+ "								<b>"+o.getName_Hotel()+"</b>\r\n"
					+ "							</div>\r\n"
					+ "							<div style=\"font-size: small; width: 100%; color: rgb(46, 93, 246);\">\r\n"
					+ "								<b> "+o.getAddress()+"</b>\r\n"
					+ "							</div>\r\n"
					+ "							<div style=\"font-size: medium; width: 100%; color: rgb(241, 22, 22);\">\r\n"
					+ "								<b> "+o.getPrice()+" VNĐ</b>\r\n"
					+ "							</div>\r\n"
					+ "						</a>\r\n"
					+ "					</div>"
					+ "");
		}
	}

}
