package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.db.ConnectionProvider;
import model.Product;
import model.dao.ProductDao;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/UpdateProductServlet" })
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
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
		String code = request.getParameter("productCode");
		String name = request.getParameter("productName");
		float price = Float.parseFloat(request.getParameter("price"));
		String brand = request.getParameter("brand");
		int stock = Integer.parseInt(request.getParameter("stock"));
		String size = request.getParameter("size");
		String description = request.getParameter("description");
		String type = request.getParameter("type");
		
		PrintWriter out = response.getWriter();
		Product product = new Product();
		
		
		product.setCode(code);
		product.setName(name);
		product.setPrice(price);
		product.setBrand(brand);
		product.setStock(stock);
		product.setSize(size);
		product.setDescription(description);
		product.setType(type);
		
		ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
		int result = dao.updateProduct(product);
		
		if(result == 0) {
//			out.println("product updated successfully");
			response.sendRedirect(request.getContextPath() + "/pages/admin/view_product.jsp");
		} else {
			out.println("Product couldn't be updated.");
		}
		
	}

}
