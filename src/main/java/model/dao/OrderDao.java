package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import model.Order;
import model.Product;

public class OrderDao {

	private Connection con;

	public OrderDao(Connection con) {
		super();
		this.con = con;
	}

	public Cart getCart(String email, String code) {
		Cart cart = null;
		try {
			String query = "SELECT * FROM cart WHERE userID=? AND productId=?";
			PreparedStatement st = this.con.prepareStatement(query);
			st.setString(1, email);
			st.setString(2, code);
			ResultSet rs = st.executeQuery();

			cart = new Cart();

			while (rs.next()) {
				cart.setProductID(rs.getString("productId"));
				cart.setUserID(rs.getString("userID"));
				cart.setQuantity(rs.getInt("quantity"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cart;
	}


	public int placeOrders(Cart cart) {
	    if (cart == null) {
	        return 0;
	    }

	    int rowsAffected = 0;
	    String email = cart.getUserID();
	    String code = cart.getProductID();
	    int quantity = cart.getQuantity();

	    try {
	        // Start a transaction
	        this.con.setAutoCommit(false);

	        // add the product to the orders table
	        String insertOrderQuery = "INSERT INTO orders (userId, productId, quantity) VALUES (?, ?, ?)";
	        PreparedStatement insertOrderStmt = this.con.prepareStatement(insertOrderQuery);
	        insertOrderStmt.setString(1, email);
	        insertOrderStmt.setString(2, code);
	        insertOrderStmt.setInt(3, quantity);
	        rowsAffected = insertOrderStmt.executeUpdate();

	        // Now remove the item from the cart
	        String deleteCartItemQuery = "DELETE FROM cart WHERE userId=? AND productId=?";
	        PreparedStatement deleteCartItemStmt = this.con.prepareStatement(deleteCartItemQuery);
	        deleteCartItemStmt.setString(1, email);
	        deleteCartItemStmt.setString(2, code);
	        deleteCartItemStmt.executeUpdate();

	        // Commit the transaction
	        this.con.commit();

	    } catch (Exception e) {
	        // Rollback the transaction if any exception occurs
	        try {
	            this.con.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	        e.printStackTrace();
	    } finally {
	        // Reset auto-commit mode
	        try {
	            this.con.setAutoCommit(true);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return rowsAffected;
	}

	
	public List<Order> getOrders(String email) {
		List<Order> orders = new ArrayList<>();
		try {
			String query = "SELECT * FROM orders WHERE userId=?";
			try (PreparedStatement stmt = this.con.prepareStatement(query)) {
				stmt.setString(1, email);
				try (ResultSet rs = stmt.executeQuery()) {
					while (rs.next()) {
						Order order = new Order(rs.getString("userId"), rs.getString("productId"), rs.getInt("quantity"), rs.getString("status"));
						orders.add(order);
					}
				}
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return orders;
	}
	
	public List<Order> getOrdersForAdmin() {
		List<Order> orders = new ArrayList<>();
		try {
			String query = "SELECT * FROM orders";
			try (PreparedStatement stmt = this.con.prepareStatement(query)) {

				try (ResultSet rs = stmt.executeQuery()) {
					while (rs.next()) {
						Order order = new Order(rs.getString("userId"), rs.getString("productId"), rs.getInt("quantity"), rs.getString("status"));
						orders.add(order);
					}
				}
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return orders;
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
	  
	  
	  
	  public int deliver(String email, String code) {
		  int rowsAffected = -1;
		  try {
			  String query = "UPDATE orders SET status=? WHERE userId=? AND productId=?";
			  PreparedStatement st = this.con.prepareStatement(query);
			  st.setString(1, "delivered");
			  st.setString(2, email);
			  st.setString(3, code);
			  
			  rowsAffected = st.executeUpdate();
			  
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		  
		  return rowsAffected;
	  }

}
