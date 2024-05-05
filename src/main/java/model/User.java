package model;

import java.io.File;

import javax.servlet.http.Part;

public class User {

	private String userName;
	private String email;
	private String password;
	private String address;
	private String phoneNumber;

	public User() {
		super();
	}

	public User(String userName, String email, String password, String address, String phoneNumber) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.address = address;
		this.phoneNumber = phoneNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "UserModel [userName=" + userName + ", email=" + email + ", password=" + password + ", address="
				+ address + ", phoneNumber=" + phoneNumber + "]";
	}
	
	
	

	
	
	

}
