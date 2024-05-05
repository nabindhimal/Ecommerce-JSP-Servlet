package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.db.ConnectionProvider;
import model.dao.ProductDao;

/**
 * Servlet implementation class RemoveProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/RemoveProductServlet" })
public class RemoveProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveProductServlet() {
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
//		doGet(request, response);
		String code = (String) request.getParameter("productCode");
		ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
		int result = dao.deleteProduct(code);
		PrintWriter out = response.getWriter();
		
		
		if(result == 0) {
			out.println("Product removed successfully.");	
		} else {
			out.println("Product with the product code cannot be found. Please check and proceed again!");
		}
	}

}
