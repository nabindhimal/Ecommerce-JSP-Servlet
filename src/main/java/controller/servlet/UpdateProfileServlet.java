package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.db.ConnectionProvider;
import model.User;
import model.dao.ProductDao;
import model.dao.UserDao;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
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
		String oldEmail = request.getParameter("oldEmail");
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String number = request.getParameter("number");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User user = new User();
		
		user.setUserName(username);
		user.setAddress(address);
		user.setEmail(email);
		user.setPhoneNumber(number);
		
		int result = dao.updateProfile(user, oldEmail);
		
		if(result == 0) {
			response.sendRedirect(request.getContextPath() + "/pages/profile.jsp");
		} else {
			PrintWriter out = response.getWriter();
			out.println("Profile couldn't be updated!");
		}
		
		
		
	}

}
