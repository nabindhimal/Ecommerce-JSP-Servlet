package model.dao;

import java.util.ArrayList;
import java.util.List;

import controller.db.ConnectionProvider;
import model.Cart;
import model.Product;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
//		Product product = new Product("sfhsf", "bbsdkd", 11, "klskd", "djhfsks", 11, "shsdj", "nccscslkc", null);
//		
//		ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
////		
////		dao.addProduct(product);
//		
//		Product product = dao.getProduct("12sdsd");
//		
//		System.out.println(product);
		
		
		CartDao dao = new CartDao(ConnectionProvider.getConnection());
//		dao.addToCart("nabin@mail.com", "k11", 22);
		
//		List<Cart> cl = new ArrayList<>();
//		
//		cl = dao.getFromCart("nabin@mail.com");
//		
//		System.out.println(cl.size());
		
		
//		dao.removeFromCart("nabin@mail.com", "code2343");
		System.out.println(dao.getProductById("k11"));

	}

}
