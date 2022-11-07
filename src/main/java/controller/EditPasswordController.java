package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import dao.DAO;
import entity.Logins;
import entity.Users;

/**
 * Servlet implementation class EditPasswordController
 */
@WebServlet("/editpassword")
public class EditPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditPasswordController() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Logins lg = (Logins) session.getAttribute("acc");
		String old_pass = request.getParameter("old_pass");
		String new_pass = request.getParameter("new_pass");
		String re_new_pass = request.getParameter("re_new_pass");
		System.out.println(old_pass);
		System.out.println(new_pass);
		System.out.println(re_new_pass);
		DAO dao = new DAO();
		if (old_pass.equals(null)) {
			request.setAttribute("err_newname", "Vui lòng nhập thông tin trước khi thực hiện thao tác");
			System.out.println("Vui lòng nhập thông tin trước khi thực hiện thao tác");
		} else {

			if (!old_pass.equals(lg.getPassworld())) {
				request.setAttribute("err_newname", "Mật khẩu cũ không chính xác vui lòng nhập lại!");
				System.out.println("Mật khẩu cũ không chính xác vui lòng nhập lại!");
			} else {
				if (!new_pass.equals(re_new_pass)) {
					request.setAttribute("err_newname", "Mật khẩu mới không trùng khớp!");
					System.out.println("Mật khẩu mới không trùng khớp!");
				} else {
					dao.EditPassword(new_pass, lg.getLogin_id());
					Logins a = dao.GetLogin(lg.getUser_name(), new_pass, lg.getLogin_type(), lg.getRole());
					session.setAttribute("acc", a);
					System.out.println("Đổi mật khẩu thành công");
					response.sendRedirect("/ProjectTravelServices/myprofile");
				}

			}

		}

	}

}
