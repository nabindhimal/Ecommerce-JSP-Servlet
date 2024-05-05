package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.db.ConnectionProvider;
import model.User;
import model.dao.CartDao;

/**
 * Servlet implementation class RemoveFromCartServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/RemoveFromCartServlet" })
public class RemoveFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveFromCartServlet() {
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
		User user = (User) (request.getSession()).getAttribute("loggedUser");
		String code = request.getParameter("productCode");
		String email = user.getEmail();
		
		CartDao dao = new CartDao(ConnectionProvider.getConnection());
		
		int result = dao.removeFromCart(email, code);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/success.jsp?message=Successfully removed from cart.");
		} else {
			response.sendRedirect(request.getContextPath() + "/error.jsp?message=Product couldnt be removed from cart.");
		}
		
	
	
	}

}
