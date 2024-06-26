package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;


@WebServlet(name = "UserRoleVerificationServlet", urlPatterns = {"/roleVerify"})
public class UserRoleVerificationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) (request.getSession()).getAttribute("loggedUser");
		if (user.getEmail().equals(getServletContext().getInitParameter("adminEmail"))) {
			response.sendRedirect(request.getContextPath() + "/pages/admin/homepage.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/pages/homepage.jsp");
		}
	}
}