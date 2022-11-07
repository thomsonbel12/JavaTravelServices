package controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SendCodeController
 */
@WebServlet("/sendcode")
public class SendCodeMailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendCodeMailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String email=(String) session.getAttribute("email1");
		String HoTen=(String) session.getAttribute("HoTen");
		String code= SendCodeEmail(HoTen, email);
		session.setAttribute("code", code);
		session.setAttribute("codesent",code);
		
		session.setAttribute("error1", null);
		session.setAttribute("error2", null);
		session.setAttribute("codeCheck", "display");
		session.setAttribute("emailCheck", "none");
		request.getRequestDispatcher("/HTML/ForgetPasswordEmail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String code_input=request.getParameter("code_input");
		HttpSession session = request.getSession();
		String code=(String) session.getAttribute("code");
		if(code_input.equals(code)) {
			response.sendRedirect("/ProjectTravelServices/resetpasswordbymail");
		}
		else 
		{
			session.setAttribute("error2", "display");
			request.getRequestDispatcher("/HTML/ForgetPasswordEmail.jsp").forward(request, response);
		}
	}
	
    private String SendCodeEmail(String HoTen, String email) {
        final String username = "haovo1512@gmail.com";
        final String password = "qvmxefewmycqdiba";
        int code = (int) Math.floor(((Math.random() * 899999) + 100000));
        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("haovo1512@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject("Code xac minh email");
            message.setText("\n\n Ma xac minh email cua ban la:\n	"+code);
            
            Transport.send(message);
            
            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
		return Integer.toString(code);
    }
}
