package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import model.Product;

public class CartDao {
	
	private Connection con;

	public CartDao(Connection con) {
		super();
		this.con = con;
	}
	
	public int addToCart(String email, String code, int quantity) {
	    int rowsAffected = 0;

	    try {
	        // Check if the product exists and the required quantity is available
	        String checkProductQuery = "SELECT * FROM Product WHERE code = ? AND stock >= ?";
	        PreparedStatement checkProductStmt = this.con.prepareStatement(checkProductQuery);
	        checkProductStmt.setString(1, code);
	        checkProductStmt.setInt(2, quantity);
	        ResultSet productResult = checkProductStmt.executeQuery();

	        if (productResult.next()) {
	            // Product exists and required quantity is available
	            // Proceed to add the product to the cart and update the stock
	            String checkCartQuery = "SELECT quantity FROM cart WHERE userID = ? AND productId = ?";
	            PreparedStatement checkCartStmt = this.con.prepareStatement(checkCartQuery);
	            checkCartStmt.setString(1, email);
	            checkCartStmt.setString(2, code);
	            ResultSet cartResult = checkCartStmt.executeQuery();

	            if (cartResult.next()) {
	                // Product already exists in the cart for the user, update the quantity
	                int existingQuantity = cartResult.getInt("quantity");
	                int newQuantity = existingQuantity + quantity;

	                String updateCartQuery = "UPDATE cart SET quantity = ? WHERE userID = ? AND productId = ?";
	                PreparedStatement updateCartStmt = this.con.prepareStatement(updateCartQuery);
	                updateCartStmt.setInt(1, newQuantity);
	                updateCartStmt.setString(2, email);
	                updateCartStmt.setString(3, code);
	                rowsAffected = updateCartStmt.executeUpdate();
	            } else {
	                // Product does not exist in the cart for the user, insert a new row
	                String insertCartQuery = "INSERT INTO cart (userID, productId, quantity) VALUES (?, ?, ?)";
	                PreparedStatement insertCartStmt = this.con.prepareStatement(insertCartQuery);
	                insertCartStmt.setString(1, email);
	                insertCartStmt.setString(2, code);
	                insertCartStmt.setInt(3, quantity);
	                rowsAffected = insertCartStmt.executeUpdate();
	            }

	            // Subtract the quantity from the Product table
	            String updateProductQuery = "UPDATE Product SET stock = stock - ? WHERE code = ?";
	            PreparedStatement updateProductStmt = this.con.prepareStatement(updateProductQuery);
	            updateProductStmt.setInt(1, quantity);
	            updateProductStmt.setString(2, code);
	            updateProductStmt.executeUpdate();
	        } else {
	            // Product does not exist or required quantity is not available
	            rowsAffected = -1;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return rowsAffected;
	}
	
	
	public List<Cart> getFromCart(String email) {
	    List<Cart> carts = new ArrayList<>();
	    try {
	        String query = "SELECT * FROM cart WHERE userID=?";
	        try (PreparedStatement stmt = this.con.prepareStatement(query)) {
	            stmt.setString(1, email);
	            try (ResultSet rs = stmt.executeQuery()) {
	                while (rs.next()) {
	                    Cart cart = new Cart(rs.getString("userID"), rs.getString("productId"), rs.getInt("quantity"));
	                    carts.add(cart);
	                }
	            }
	        }
	    } catch (SQLException e) {
	        // Log the error or handle it gracefully
	        e.printStackTrace();
	    }
	    return carts;
	}

	
	public int removeFromCart(String email, String code) {
	    int result = -1;
	    try {
	        // Get the quantity of the item being removed from the cart
	        String selectQuery = "SELECT quantity FROM cart WHERE userID=? AND productId=?";
	        PreparedStatement selectStmt = this.con.prepareStatement(selectQuery);
	        selectStmt.setString(1, email);
	        selectStmt.setString(2, code);
	        ResultSet resultSet = selectStmt.executeQuery();
	        
	        int quantityToRemove = 0;
	        if(resultSet.next()) {
	            quantityToRemove = resultSet.getInt("quantity");
	        }
	        
	        // Remove the item from the cart
	        String deleteQuery = "DELETE FROM cart WHERE userID=? AND productId=?";
	        PreparedStatement deleteStmt = this.con.prepareStatement(deleteQuery);
	        deleteStmt.setString(1, email);
	        deleteStmt.setString(2, code);
	        int rowsaffected1 = deleteStmt.executeUpdate();
	        
	        // Add the quantity back to the product stock
	        String updateQuery = "UPDATE Product SET stock = stock + ? WHERE code=?";
	        PreparedStatement updateStmt = this.con.prepareStatement(updateQuery);
	        updateStmt.setInt(1, quantityToRemove);
	        updateStmt.setString(2, code);
	        int rowsaffected2= updateStmt.executeUpdate();
	        
	        result = rowsaffected1 + rowsaffected2;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return result;
	}


	
	  public Product getProductById(String productId) {
	        Product product = null;
	        String query = "SELECT * FROM Product WHERE code= ?";
	        
	        try {
	        	PreparedStatement preparedStatement = this.con.prepareStatement(query);
	            preparedStatement.setString(1, productId);
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                if (resultSet.next()) {
	                    product = new Product();
	                    product.setCode(resultSet.getString("code"));
	                    product.setName(resultSet.getString("name"));
	                    product.setProductImage(resultSet.getString("productImage"));
	                    product.setPrice(resultSet.getFloat("price"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return product;
	    }
	  
//		public ArrayList<Cart> getCartList(String email) {
//		    ArrayList<Cart> carts = new ArrayList<>();
//		    try {
//		        String query = "SELECT * FROM cart WHERE userID=?";
//		        try (PreparedStatement stmt = this.con.prepareStatement(query)) {
//		            stmt.setString(1, email);
//		            try (ResultSet rs = stmt.executeQuery()) {
//		                while (rs.next()) {
//		                    Cart cart = new Cart(rs.getString("userID"), rs.getString("productId"), rs.getInt("quantity"));
//		                    carts.add(cart);
//		                }
//		            }
//		        }
//		    } catch (SQLException e) {
//		        // Log the error or handle it gracefully
//		        e.printStackTrace();
//		    }
//		    return carts;
//		}


	
	

}
