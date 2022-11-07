package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.Gson;
//import com.google.gson.JsonObject;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.types.User;

import dao.DAO;
import entity.Logins;

/**
 * Servlet implementation class LoginFacebookController
 */
@WebServlet("/LoginFacebook")
public class LoginFacebookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String FACEBOOK_APP_ID = "515625173274802";
	public static String FACEBOOK_APP_SECRET = "823031fd00ef84d519ce4826e472de2d";
	public static String FACEBOOK_REDIRECT_URL = "http://localhost:8080/ProjectTravelServices/LoginFacebook";
	public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
	public static String FACEBOOK_LINK_GET_USER_INFO = "https://graph.facebook.com/me?access_token=";

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public LoginFacebookController() {
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
		String code = request.getParameter("code");
		String avatar="https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg";
		HttpSession session = request.getSession();
		if (code == null || code.isEmpty()) {
			RequestDispatcher dis = request.getRequestDispatcher("/TravelServices/login");
			dis.forward(request, response);
		} 
		else 
		{
			String accessToken = getToken(code);
			User user = getUserInfo(accessToken);
			DAO login_facebook=new DAO();
			Logins a=login_facebook.CheckLoginFacebook(user.getId());
			if(a!=null)
			{
				login_facebook.UpdateImage(avatar, a.getLogin_id());
				session.setAttribute("avatar", avatar);
				session.setAttribute("displayed", "display : none;");
				session.setAttribute("acc", a);
				response.sendRedirect("/ProjectTravelServices/home");
			}
			else 
			{
				login_facebook.Insert_Login(user.getId(),"facebook", "user", null);
				Logins p=login_facebook.CheckLoginFacebook(user.getId());
				login_facebook.Insert_User(p.getLogin_id(),user.getName(), avatar, null);
				session.setAttribute("avatar", avatar);
				session.setAttribute("displayed", "display : none;");
				session.setAttribute("acc", p);
				response.sendRedirect("/ProjectTravelServices/home");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


	/*
	 * public AccountFacebook getUserInfo(final String accessToken) throws
	 * ClientProtocolException, IOException { String link =
	 * FACEBOOK_LINK_GET_USER_INFO + accessToken; String response =
	 * Request.Get(link).execute().returnContent().asString(); ObjectMapper mapper =
	 * new ObjectMapper(); AccountFacebook AccountFacebook =
	 * mapper.readValue(response, AccountFacebook.class);
	 * System.out.println(AccountFacebook); return AccountFacebook; }
	 */

	public static User getUserInfo(String accessToken) {
		FacebookClient facebookClient = new DefaultFacebookClient(accessToken, FACEBOOK_APP_SECRET, Version.LATEST);
		return facebookClient.fetchObject("me", User.class);
	}


	public String getToken(final String code) throws ClientProtocolException, IOException {
		String link = String.format(FACEBOOK_LINK_GET_TOKEN, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, FACEBOOK_REDIRECT_URL, code);
		String response = Request.Get(link).execute().returnContent().asString();
		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readTree(response).get("access_token");
		return node.textValue();
	}

}
