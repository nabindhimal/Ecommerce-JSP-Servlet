package model;

public class Order {

	private String userID;
	private String productID;
	private int quantity;
	private String status;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(String userID, String productID, int quantity, String status) {
		super();
		this.userID = userID;
		this.productID = productID;
		this.quantity = quantity;
		this.status = status;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getProductID() {
		return productID;
	}
	
	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Order [userID=" + userID + ", productID=" + productID + ", quantity=" + quantity + ", status=" + status
				+ "]";
	}
	

	

}
