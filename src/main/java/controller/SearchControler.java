package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.DisplayHotelsBySearch;

/**
 * Servlet implementation class SearchControler
 */
@WebServlet("/search")
public class SearchControler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchControler() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String search_input = request.getParameter("search_input");
		System.out.println(search_input);

		if (!search_input.equals("")) {
			DAO dao = new DAO();
			List<DisplayHotelsBySearch> list = dao.getAllHotelsBySearch(search_input);
//			for(DisplayHotelsBySearch o:list) {
//				System.out.println(o);
//			}
			if (!list.isEmpty()) {	
				request.setAttribute("listSearchHotels", list);
				session.setAttribute("error_search", null);
				request.setAttribute("search_value", search_input);
				request.getRequestDispatcher("/HTML/search.jsp").forward(request, response);
			}
			else {
				session.setAttribute("error_search", "Kh??ng t??m th???y kh??ch s???n ho???c ?????a ??i???m nh?? b???n mong mu???n.");
				response.sendRedirect("/ProjectTravelServices/home");
			}

		} else {
			session.setAttribute("error_search",
					"Vui l??ng nh???p ?????a ??i???m du l???ch ho???c t??n kh??ch s???n tr?????c khi th???c hi???n thao t??c t??m ki???m.");
			response.sendRedirect("/ProjectTravelServices/home");
		}
	}

}
