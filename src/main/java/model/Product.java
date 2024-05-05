package model;

import java.io.File;

import javax.servlet.http.Part;

public class Product {

	private String code;
	private String name;
	private float price;
	private String brand;
	private String productImage;
	private int stock;
	private String size;
	private String description;
	private String type;
	

	public Product() {
		super();
	}

	public Product(String code, String name, float price, String brand, Part image,  int stock,
			String size, String description, String type) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.brand = brand;
		this.productImage = getImageUrl(image);
		this.stock = stock;

		this.size = size;
		this.description = description;
		this.type = type;
	}
	
	public Product(String code, String name, float price, String brand, String image,  int stock,
			String size, String description, String type) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.brand = brand;
		this.productImage = image;
		this.stock = stock;

		this.size = size;
		this.description = description;
		this.type = type;
	}
	

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {

		return price;
	}

	public String getSize() {
		return size;
	}

	public String getDescription() {
		return description;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}



	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	

	@Override
	public String toString() {
		return "Product [code=" + code + ", name=" + name + ", price=" + price + ", brand=" + brand + ", productImage="
				+ productImage + ", stock=" + stock + ", size=" + size + ", description=" + description + ", type="
				+ type + "]";
	}

	private String getImageUrl(Part imagePart) {
		String savePath = "/home/mennnk/eclipse-workspace/ELiteScreens/src/main/webapp/images";
		File fileSaveDir = new File(savePath);
		String productImage = null;
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String contentDisp = imagePart.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				productImage = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		if (productImage == null || productImage.isEmpty()) {
			productImage = "default.jpg";
		}
		return productImage;
	}

	public String getImageUrlFromPart() {
		return productImage;
	}

	public void setImageUrlFromPart(Part part) {
		this.productImage = getImageUrl(part);
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	
	
}
