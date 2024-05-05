package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Product;

public class ProductDao {

	private Connection con;

	public ProductDao(Connection con) {
		super();
		this.con = con;
	}

	public int addProduct(Product product) {
		int result = -1;

		try {
			String query = "INSERT INTO Product(code, name, price, brand, productImage, stock, size, description, type) values(?,?,?,?,?,?,?,?,?)";

			PreparedStatement stmt = this.con.prepareStatement(query);

			stmt.setString(1, product.getCode());
			stmt.setString(2, product.getName());
			stmt.setFloat(3, product.getPrice());
			stmt.setString(4, product.getBrand());
			stmt.setString(5, product.getProductImage());
			stmt.setInt(6, product.getStock());
			stmt.setString(7, product.getSize());
			stmt.setString(8, product.getDescription());
			stmt.setString(9, product.getType());

			stmt.executeUpdate();

			result = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public Product getProduct(String code) {
		Product product = null;
		ResultSet rs = null;

		try {
			String query = "SELECT * FROM Product WHERE code=?";

			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, code);

			rs = stmt.executeQuery();

			while (rs.next()) {
				product = new Product();
				
				product.setCode(rs.getString("code"));
				product.setDescription(rs.getString("description"));
				product.setProductImage(rs.getString("productImage"));
				product.setPrice(rs.getFloat("price"));
				product.setName(rs.getString("name"));
				product.setBrand(rs.getString("brand"));
				product.setStock(rs.getInt("stock"));
				product.setSize(rs.getString("size"));
				product.setType(rs.getString("type"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return product;
	}

	public int updateProduct(Product product) {
		int result = -1;

		try {
			String query = "UPDATE Product SET name=?, price =?, brand=?, stock=?,size=?,description=?, type=? WHERE code=?";

			PreparedStatement stmt = this.con.prepareStatement(query);

			stmt.setString(1, product.getName());
			stmt.setFloat(2, product.getPrice());
			stmt.setString(3, product.getBrand());
			stmt.setInt(4, product.getStock());
			stmt.setString(5, product.getSize());
			stmt.setString(6, product.getDescription());
			stmt.setString(7, product.getType());
			stmt.setString(8, product.getCode());

			stmt.executeUpdate();

			result = 0;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public List<Product> viewProduct() {

		List<Product> products = new ArrayList<>();
		try {
			String query = "SELECT * FROM Product";
			PreparedStatement stmt = this.con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Product product = new Product(rs.getString("code"), rs.getString("name"), rs.getFloat("price"),
						rs.getString("brand"), rs.getString("productImage"), rs.getInt("stock"), rs.getString("size"), rs.getString("description"), rs.getString("type"));

				products.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	public int checkProduct(String code) {
		Product product = getProduct(code);

		if (product != null)
			return 0;
		else
			return -1;
	}


	
	
	public int deleteProduct(String code) {
	    int result = -1;

	    try {
	        String query = "DELETE FROM Product WHERE code=?";

	        PreparedStatement stmt = this.con.prepareStatement(query);
	        stmt.setString(1, code);
	        int rowsAffected = stmt.executeUpdate();

	        if (rowsAffected > 0) {
	            // Product successfully deleted
	            result = 0;
	        } else {
	            // Product with given code not found
	            result = 1;
	        }
	    } catch (SQLException e) {
	        // Handle SQL exception
	        e.printStackTrace();
	        // Return appropriate error code
	        result = -1;
	    } 

	    return result;
	}
	
	public ArrayList<Product> searchProduct(String query, String searchType) {
	    ArrayList<Product> searches = new ArrayList<>();
	    if("name".equals(searchType)) {
	        String sql = "SELECT * FROM Product WHERE LOWER(name) LIKE ?";
	        try {
	            PreparedStatement st = this.con.prepareStatement(sql);
	            st.setString(1, "%" + query + "%");
	            ResultSet rs = st.executeQuery();

	            while (rs.next()) {
	                Product product = new Product(rs.getString("code"), rs.getString("name"), rs.getFloat("price"),
	                        rs.getString("brand"), rs.getString("productImage"), rs.getInt("stock"), rs.getString("size"), rs.getString("description"), rs.getString("type"));

	                searches.add(product);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    } else if("price".equals(searchType)) {
	        String sql = "SELECT * FROM Product WHERE price = ?";
	        try {
	            float price = Float.parseFloat(query);
	            PreparedStatement st = this.con.prepareStatement(sql);
	            st.setFloat(1, price);
	            ResultSet rs = st.executeQuery();

	            while (rs.next()) {
	                Product product = new Product(rs.getString("code"), rs.getString("name"), rs.getFloat("price"),
	                        rs.getString("brand"), rs.getString("productImage"), rs.getInt("stock"), rs.getString("size"), rs.getString("description"), rs.getString("type"));

	                searches.add(product);
	            }
	        } catch (NumberFormatException | SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return searches;
	}



}
