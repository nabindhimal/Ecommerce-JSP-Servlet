package controller.servlet;

import controller.db.ConnectionProvider;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.dao.UserDao;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDao dao = new UserDao(ConnectionProvider.getConnection());

	public RegisterServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter(StringUtils.USER_NAME);
		String email = request.getParameter(StringUtils.EMAIL);
		String phoneNumber = request.getParameter(StringUtils.PHONE_NUMBER);
		String address = request.getParameter(StringUtils.ADDRESS);
		String password = request.getParameter(StringUtils.PASSWORD);
		String retypePassword = request.getParameter(StringUtils.RETYPE_PASSWORD);

		// PhoneNumber Format requirement

		if(!isValidPhoneNumber(phoneNumber) ) {
			response.sendRedirect(request.getContextPath()+"/error.jsp?message=Phone number must be +countryCode0000000000.");
			return;
		}
		
		// Password COmplexity and matching passwords

		if(!isValidPassword(password, retypePassword)) {
			response.sendRedirect(request.getContextPath()+"/error.jsp?message=password must be greater than 6 and must match with retype password.");
			return;
		}

		User user = new User(userName, email, password, address, phoneNumber);
		int result = dao.addUser(user);

		System.out.println(result);

		if (result == 1) {
			request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_REGISTER_MESSAGE);
			response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
		} else if (result == 0) {
			request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_REGISTER_MESSAGE);
			request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
		} else {
			request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
			request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
		}
	}

	private boolean isValidPassword(String password, String retypePassword) {
		return password.length() > 6 && password.equals(retypePassword);
	}

	private boolean isValidPhoneNumber(String phoneNumber) {
		return phoneNumber.startsWith("+") && phoneNumber.length() == 14;
	}


}
