package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.db.ConnectionProvider;
import model.User;
import model.dao.UserDao;
import util.StringUtils;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	UserDao dao = new UserDao(ConnectionProvider.getConnection());
	
    public LoginServlet() {
        super(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = dao.verifyUser(email, password);
		
		if (user == null) {
			request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_LOGIN_MESSAGE);
		    request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);

		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loggedUser", user);
			session.setMaxInactiveInterval(30*3);
			
			Cookie userCookie = new Cookie("user", user.getUserName());
			userCookie.setMaxAge(30*60);
			response.addCookie(userCookie);
			
		    request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_LOGIN_MESSAGE);
		    response.sendRedirect(request.getContextPath() + "/roleVerify");
		}

		
		

	}

	


}
