package controller.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
 * Servlet implementation class OrderAllServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/OrderAllServlet" })
public class OrderAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderAllServlet() {
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
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("loggedUser");
        
        if (loggedUser == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        String email = loggedUser.getEmail();
        
        OrderDao dao = new OrderDao(ConnectionProvider.getConnection());
        CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
        List<Cart> cartList = cartDao.getFromCart(email);
        
        for (Cart cart : cartList) {
//            int rowsAffected = dao.placeOrder(cartItem);
        	 int rowsAffected = dao.placeOrders(cart);
            
            if (rowsAffected <= 0) {
                // Handle error if order couldn't be placed for any item
                response.sendRedirect(request.getContextPath() + "/error.jsp?message=Order couldn't be placed.");
                return;
            }
        }
        
        // If all orders were successfully placed, redirect to success page
        response.sendRedirect(request.getContextPath() + "/success.jsp?message=All orders placed successfully.");
    }

}
