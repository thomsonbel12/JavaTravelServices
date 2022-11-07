package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/**
 * Servlet implementation class ResetPasswordByPhoneController
 */
@WebServlet("/resetpasswordbyphone")
public class ResetPasswordByPhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordByPhoneController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("errorphone2", null);
		session.setAttribute("resetPassPhone", "display");
		session.setAttribute("codeCheckPhone", null);
		request.getRequestDispatcher("/HTML/ForgetPasswordPhone.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password=request.getParameter("pass-phone-input");
		String repassword=request.getParameter("repass-phone-input");
		HttpSession session = request.getSession();
		if(password.equals(repassword)) {
			String phone=(String) session.getAttribute("phone1");
			DAO dao=new DAO();
//			dao.UpdatePasswordByMail("2", "hoanhao1512@gmail.com");
			dao.UpdatePasswordByPhone(password, phone);
			session.setAttribute("errorphone3", null);
			session.setAttribute("resetPassPhone", null);
			session.setAttribute("phoneCheck", null);
			response.sendRedirect("/ProjectTravelServices/login");
		}
		else {
			session.setAttribute("errorphone3", "display");
			request.getRequestDispatcher("/HTML/ForgetPasswordEmail.jsp").forward(request, response);
		}
	}

}
