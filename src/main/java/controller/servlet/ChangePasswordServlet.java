package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.db.ConnectionProvider;
import model.dao.UserDao;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email = request.getParameter("email");
		
		String password = request.getParameter("password");
		String retypePassword = request.getParameter("retypePassword");
		
		if(!isValidPassword(password, retypePassword)) {
			response.sendRedirect(request.getContextPath()+"/pages/profile.jsp?error=password");
			return;
		}
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		int result = dao.changePassword(email, password);
		
		if(result == 0) {
			response.sendRedirect(request.getContextPath()+"/pages/profile.jsp");
		} else {
			response.sendRedirect(request.getContextPath()+"/pages/profile.jsp?error=password");
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	private boolean isValidPassword(String password, String retypePassword) {
		return password.equals(retypePassword);
	}

}
