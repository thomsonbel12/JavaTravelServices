package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Benefits;
import entity.DisplayHotels;
import entity.Rooms;

/**
 * Servlet implementation class RoomController
 */
@WebServlet("/room")
public class RoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int hotelID= Integer.parseInt(request.getParameter("hotelID"));
//		HttpSession session = request.getSession();
		DAO dao = new DAO();
		DisplayHotels hotel = dao.getHotelsByHotelId(hotelID);
		List<Rooms> listRooms = dao.getAllRoomByHotelId(hotelID);
		List<Benefits> listBenefits = dao.GetAllBenefitsByHotelId(hotelID);
		request.setAttribute("Hotels_Image", hotel.getImage());
		request.setAttribute("Hotel_Name", hotel.getName_Hotel());
		request.setAttribute("Hotel_Address", hotel.getAddress());
		request.setAttribute("Decription", hotel.getDecription());
		request.setAttribute("listRooms", listRooms);
		request.setAttribute("listBenefits", listBenefits); 
		request.getRequestDispatcher("/HTML/room.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
