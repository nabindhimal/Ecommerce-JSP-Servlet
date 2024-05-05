package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.db.ConnectionProvider;
import model.Cart;
import model.dao.OrderDao;

/**
 * Servlet implementation class DeliverServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/DeliverServlet" })
public class DeliverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeliverServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("productCode");
		String email = request.getParameter("email");

		OrderDao dao = new OrderDao(ConnectionProvider.getConnection());
		int rowsAffected = dao.deliver(email, code);
		
		  if (rowsAffected > 0) {
		        response.sendRedirect(request.getContextPath() + "/admin_success.jsp?message=Product delivered successfully.");
		    } else if (rowsAffected == 0) {
		        response.sendRedirect(request.getContextPath() + "/admin_success.jsp?message=Product already delivered.");
		    } else {
		        response.sendRedirect(request.getContextPath() + "/admin_success.jsp?message=Product couldn't be delivered.");
		    }
	}

}
