package controller.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.db.ConnectionProvider;
import model.Product;
import model.dao.ProductDao;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = { "/AddProductServlet" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100)
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
//	private static final String UPLOAD_DIR = "uploads";

	public AddProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		float price = Float.parseFloat(request.getParameter("price"));
		String brand = request.getParameter("brand");
		int stock = Integer.parseInt(request.getParameter("stock"));
		String size = request.getParameter("size");
		String description = request.getParameter("description");
		String type = request.getParameter("type");

		// Upload product image
		String UPLOAD_DIR = StringUtils.UPLOAD_DIR;
		Part filePart = request.getPart("productImage");

		PrintWriter out = response.getWriter();

		Product product = new Product(code, name, price, brand, filePart, stock, size, description, type);

		String fileName = product.getImageUrlFromPart();
		if (!fileName.isEmpty() && fileName != null) {
			filePart.write(UPLOAD_DIR + fileName);
		}

		int result = dao.addProduct(product);

		if (result == 0) {
			out.println("Product added succesfully.");
		} else {
			out.println("Product could not be added.");
		}
	}

}
