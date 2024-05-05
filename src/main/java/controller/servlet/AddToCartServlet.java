package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.db.ConnectionProvider;
import model.User;
import model.dao.CartDao;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/addToCart" })
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
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
	    String code = request.getParameter("productCode");
	    int quantity = Integer.parseInt(request.getParameter("quantity"));

	    // Get the logged-in user's email from the loggedUser object in the session
	    HttpSession session = request.getSession();
	    User loggedUser = (User) session.getAttribute("loggedUser");
	    
	    if (loggedUser == null) {
	        // User is not logged in, handle the case accordingly
	        response.sendRedirect(request.getContextPath() + "/login.jsp");
	        return; // Stop further execution
	    }

	    String email = loggedUser.getEmail(); // Assuming getEmail() returns the user's email

	    // Instantiate your CartDao and call the addToCart method
	    CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
	    int rowsAffected = cartDao.addToCart(email, code, quantity);

	    if (rowsAffected > 0) {
	        // Product added to cart successfully
	        // Redirect the user to a success page or show a success message
	        response.sendRedirect(request.getContextPath() + "/success.jsp?message=Product successfully added to cart.");
	    } else if (rowsAffected == 0) {
	        // Product addition failed
	        // Redirect the user to an error page or show an error message
	        response.sendRedirect(request.getContextPath() + "/error.jsp");
	    } else {
	        // Product does not exist or required quantity is not available
	        // Redirect the user to an out of stock page or show an appropriate message
	        response.sendRedirect(request.getContextPath() + "/error.jsp?message=Product is out of stock.");
	    }
	}


}
