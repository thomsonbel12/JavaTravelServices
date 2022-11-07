package controller;

import java.io.IOException;
import java.net.URI;
import java.util.Arrays;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;

/**
 * Servlet implementation class SendCodePhoneController
 */
@WebServlet("/sendcodephone")
public class SendCodePhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendCodePhoneController() {
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
		HttpSession session = request.getSession();
		String phone = (String) session.getAttribute("phone1");
		String HoTen = (String) session.getAttribute("HoTen");
		String code = SendCodePhone(HoTen, phone);
		session.setAttribute("codephonesent", code);
		System.out.println(code);
		session.setAttribute("errorphone1", null);
		session.setAttribute("errorphone2", null);
		session.setAttribute("codeCheckPhone", "display");
		session.setAttribute("phoneCheck", "none");
		request.getRequestDispatcher("/HTML/ForgetPasswordPhone.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code_input = request.getParameter("code-input-phone");
		HttpSession session = request.getSession();
		String code = (String) session.getAttribute("codephonesent");
		if (code_input.equals(code)) {
			response.sendRedirect("/ProjectTravelServices/resetpasswordbyphone");
		} else {
			session.setAttribute("errorphone2", "display");
			request.getRequestDispatcher("/HTML/ForgetPasswordPhone.jsp").forward(request, response);
		}
	}

	public String SendCodePhone(String Phone, String HoTen) {
		int code = (int) Math.floor(((Math.random() * 899999) + 100000));
		String ACCOUNT_SID = "AC1cae1655a2f10e691536564c8545c802";
		String AUTH_TOKEN = "732b1318dd1e98779f41c2aaa2b92761";
		String messageBody = "Your OTP is: "+code;
		

	    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

	   
	    Message message = Message.creator(
	        new com.twilio.type.PhoneNumber("+84974991941"),
	        new com.twilio.type.PhoneNumber("+18884825578"),
	        messageBody)
	    .setMediaUrl(
	    		Arrays.asList(URI.create("https://demo.twilio.com/owl.png")))
	    .create();
	    System.out.println(message.getSid());
		return Integer.toString(code);
	}

}
