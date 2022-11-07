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
 * Servlet implementation class ForgotPasswordByMailController
 */
@WebServlet("/resetpasswordbymail")
public class ResetPasswordByMailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordByMailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("error2", null);
		session.setAttribute("resetPass", "display");
		session.setAttribute("codeCheck", null);
		request.getRequestDispatcher("/HTML/ForgetPasswordEmail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String password=request.getParameter("password-reset");
		String repassword=request.getParameter("repassword-reset");
		HttpSession session = request.getSession();
		if(password.equals(repassword)) {
			String email=(String) session.getAttribute("email1");
			DAO dao=new DAO();
//			dao.UpdatePasswordByMail("2", "hoanhao1512@gmail.com");
			dao.UpdatePasswordByMail(password, email);
			session.setAttribute("error3", null);
			session.setAttribute("resetPass", null);
			session.setAttribute("emailCheck", null);
			response.sendRedirect("/ProjectTravelServices/login");
		}
		else {
			session.setAttribute("error3", "display");
			request.getRequestDispatcher("/HTML/ForgetPasswordEmail.jsp").forward(request, response);
		}
	}
}
