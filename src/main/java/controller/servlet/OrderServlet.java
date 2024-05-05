package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.db.ConnectionProvider;
import model.Cart;
import model.User;
import model.dao.CartDao;
import model.dao.OrderDao;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/OrderServlet" })
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		String code = request.getParameter("productCode");

	    // Get the logged-in user's email from the loggedUser object in the session
	    HttpSession session = request.getSession();
	    User loggedUser = (User) session.getAttribute("loggedUser");
	    
	    if (loggedUser == null) {
	        // User is not logged in, handle the case accordingly
	        response.sendRedirect(request.getContextPath() + "/login.jsp");
	        return; // Stop further execution
	    }

	    String email = loggedUser.getEmail(); // Assuming getEmail() returns the user's email

	    OrderDao dao = new OrderDao(ConnectionProvider.getConnection());
	    Cart cart = dao.getCart(email, code);
	    int rowsAffected = dao.placeOrders(cart);

	    if (rowsAffected > 0) {
	        response.sendRedirect(request.getContextPath() + "/success.jsp?message=Order placed successfully.");
	    } else if (rowsAffected == 0) {
	        response.sendRedirect(request.getContextPath() + "/error.jsp?message=Order couldn't be placed.");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/error.jsp?message=Order couldn't be placed.");
	    }
	}

}
