package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Encryption;
import model.User;

/**
 * DAO class responsible for handling user related info in the database.
 */

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	public int addUser(User user) {
		int result = 0;

		try {
			String encryptedPassword = Encryption.encrypt(user.getPassword());

			String query = "INSERT INTO users(username,email,address,phoneNumber,password) values(?,?,?,?,?)";

			PreparedStatement psmt = this.con.prepareStatement(query);

			psmt.setString(1, user.getUserName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getAddress());
			psmt.setString(4, user.getPhoneNumber());
			psmt.setString(5, encryptedPassword);
			psmt.executeUpdate();

			result = 1;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;

	}

	public int changePassword(String email, String password) {
		int result = -1;

		try {
			String newPassword = Encryption.encrypt(password);

			String query = "UPDATE users SET password = ? WHERE email = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);

			psmt.setString(1, newPassword);
			psmt.setString(2, email);
			psmt.executeUpdate();

			result = 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public User getUser(String email) {

		User user = null;
		ResultSet rs = null;

		try {
			String query = "SELECT * FROM users WHERE email=?";

			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, email);

			rs = stmt.executeQuery();

			while (rs.next()) {
				user = new User();

				user.setUserName(rs.getString("userName"));
				user.setUserName(rs.getString("email"));
				user.setUserName(rs.getString("address"));
				user.setUserName(rs.getString("phoneNumber"));
				user.setUserName(rs.getString("password"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;

	}
	
	public User verifyUser(String email, String password) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User user = null;

		try {
			
			 String encryptedPassword = Encryption.encrypt(password);
			 
			 
			// Execute SQL query
			String sql = "SELECT * FROM users WHERE email=? AND password=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, encryptedPassword);

			rs = stmt.executeQuery();

			// get values from the database
			while (rs.next()) {
				 String storedPassword = rs.getString("password");
		            String decryptedPassword = Encryption.decrypt(storedPassword);
		            if (password.equals(decryptedPassword)) {
				user = new User();

				user.setEmail(rs.getString("email"));
				user.setUserName(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setAddress(rs.getString("address"));
				user.setPhoneNumber(rs.getString("phoneNumber"));
		            }
			}
		} catch (SQLException e) {
			// Handle database errors
			e.printStackTrace();

		}
		return user;
	}

	public int verifyLogin(String username, String password) {
		int result = 0;
		
		ResultSet rs = null;
		User user = null;
		
		try {
			String encryptedPassword = Encryption.encrypt(password);
			
			
			String query = "SELECT * FROM users WHERE username=? AND password=?";
			
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, encryptedPassword);
			
			rs = stmt.executeQuery();
			
			
			while(rs.next()) {
				String decryptedPassword = Encryption.decrypt(rs.getString("password"));
				
				
				if(password.equals(decryptedPassword)) {
					result = 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;

	}

	public int updateProfile(User user, String email) {
		int result = -1;

		try {

			String query = "UPDATE users SET username = ?, address = ?, phoneNumber = ?, email=? WHERE email = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, user.getUserName());
			psmt.setString(2, user.getAddress());
			psmt.setString(3, user.getPhoneNumber());
			psmt.setString(4, user.getEmail());
			psmt.setString(5, email);
			psmt.executeUpdate();

			result = 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	public int deleteUser(String username, String email) {
		int result = -1;
		
		try {
			String query = "DELETE FROM users WHERE username=? AND email=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			
			psmt.setString(1, username);
			psmt.setString(2, email);
			psmt.executeUpdate();
			
			result = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public int saveFeedback(String email, String feedback) {
	    int result = -1;
	    
	    try {
	        String query = "INSERT INTO feedback(email, message) VALUES(?,?)";
	        PreparedStatement psmt = this.con.prepareStatement(query);
	        
	        psmt.setString(1, email);
	        psmt.setString(2, feedback);
	        
	        int rowsAffected = psmt.executeUpdate();
	        
	        if (rowsAffected > 0) {
	            result = 0;
	        } else {
	            result = -1; 
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        result = -1; 
	    } 
	    
	    return result;
	}
	
}
