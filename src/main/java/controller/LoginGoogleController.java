package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.ClientProtocolException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DAO;
import entity.AccountGoogle;
import entity.Logins;
import entity.Users;

/**
 * Servlet implementation class LoginGooglleController
 */
@WebServlet(urlPatterns="/LoginGoogle")
public class LoginGoogleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String GOOGLE_CLIENT_ID = "312248185997-3feand2bf5kmuv8962vc3v72r5p4hoa7.apps.googleusercontent.com";
	public static String GOOGLE_CLIENT_SECRET = "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";
	public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/ProjectTravelServices/LoginGoogle";
	public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
	public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
	public static String GOOGLE_GRANT_TYPE = "authorization_code";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginGoogleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code=request.getParameter("code");
		String accessToken=getToken(code);
		AccountGoogle usergg = getUserInfo(accessToken);
		HttpSession session = request.getSession();
		DAO login_google=new DAO();
		Logins a=login_google.CheckLoginGoogle(usergg.getEmail());
		if(a!=null)
		{
			login_google.UpdateImage(usergg.getPicture(), a.getLogin_id());
			Users user=login_google.GetUsers(a.getLogin_id());
			session.setAttribute("avatar", user.getAvatar());
			session.setAttribute("displayed", "display : none;");
			session.setAttribute("acc", a);
			response.sendRedirect("/ProjectTravelServices/home");
		}
		else 
		{
			login_google.Insert_Login(usergg.getEmail(),"google", "user", null);
			Logins p=login_google.CheckLoginGoogle(usergg.getEmail());
			login_google.Insert_User(p.getLogin_id(),usergg.getName(), usergg.getPicture(), null);
			session.setAttribute("avatar", usergg.getPicture());
			session.setAttribute("displayed", "display : none;");
			session.setAttribute("acc", p);
			response.sendRedirect("/ProjectTravelServices/home");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public String getToken(String code) throws ClientProtocolException, IOException {
		String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
						.add("client_secret", GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();

		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readTree(response).get("access_token");
		return node.textValue();
	}

	public AccountGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();
		ObjectMapper mapper = new ObjectMapper();
		AccountGoogle AccountGoogle = mapper.readValue(response, AccountGoogle.class);
		return AccountGoogle;
	}
}
