package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.db.ConnectionProvider;
import model.User;
import model.dao.UserDao;

/**
 * Servlet implementation class DeleteAccountServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/DeleteAccountServlet" })
public class DeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		User user = (User) session.getAttribute("loggedUser");
		String username = user.getUserName();
		String email = user.getEmail();
		
		int result = dao.deleteUser(username, email);
		
		if(result == 0) {
			response.sendRedirect(request.getContextPath() + "/LogoutServlet");
		} else {
			out.println("User couldn't be deleted! Please try again!");
		}
	}

}
