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
 * Servlet implementation class FeedbackServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/FeedbackServlet" })
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackServlet() {
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
		String feedback = request.getParameter("feedback");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		int result = dao.saveFeedback(email, feedback);
		
		if(result == 0) {
			response.sendRedirect(request.getContextPath() + "/success.jsp?message=Feedback sent successfully.");
		} else {
			response.sendRedirect(request.getContextPath() + "/error.jsp?message=Feedback couldn't be sent. Please try again.");
		}
		
	}

}
