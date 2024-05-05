package controller.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.db.ConnectionProvider;
import model.Product;
import model.dao.ProductDao;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/search" })
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Extract search query and search type from request parameters
        String query = request.getParameter("query");
        String searchType = request.getParameter("searchType");

        // Perform search based on search type
        ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
        ArrayList<Product> searches = dao.searchProduct(query, searchType);

        // Forward the request to search.jsp along with search results
        request.setAttribute("searchResults", searches);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/search.jsp");
        dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
