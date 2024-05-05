package model;

public class Cart {

	private String userID;
	private String productID;
	private int quantity;

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(String userID, String productID, int quantity) {
		super();
		this.userID = userID;
		this.productID = productID;
		this.quantity = quantity;
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
		return "Cart [userID=" + userID + ", productID=" + productID + ", quantity=" + quantity + "]";
	}

	
	
	
}
