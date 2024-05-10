package util;

public class StringUtils {
	// upload dir
	
	public static final String UPLOAD_DIR = "/home/mennnk/eclipse-workspace/EliteScreens/src/main/webapp/images/";
	
	// Start SQL Queries
	public static final String INSERT_USER = "INSERT INTO users "
			+ "(userName, email, address, phoneNumber,password)" 
			+ "VALUES (?,?,?,?,?)";

	public static final String INSERT_STUDENT = "INSERT INTO student_info2 "
								+ "(user_name, first_name, last_name, dob, gender, email, phone_number, subject, password)" 
								+ "VALUES (?,?,?,?,?,?,?,?,?)";

	public static final String GET_LOGIN_INFO = "SELECT first_name, last_name from student_info2 WHERE user_name = ?";
	
	public static final String GET_ALL_STUDENT_INFO = "SELECT * FROM student_info";
	
	public static final String GET_LOGIN_STUDENT_INFO = "SELECT * FROM student_info2 where user_name = ? AND password = ?";
	public static final String GET_LOGIN_USER_INFO = "SELECT userName, password FROM users where userName = ? AND password = ?";
	// End SQL Queries
	
	
	// Start Parameter names
		public static final String USER_NAME = "username";
		public static final String FIRST_NAME = "firstName";
		public static final String LAST_NAME = "lastName";
		public static final String BIRTHDAY = "birthday";
		public static final String GENDER = "gender";
		public static final String EMAIL = "email";
		public static final String PHONE_NUMBER = "number";
		public static final String ADDRESS = "address";
		public static final String PASSWORD = "password";
		public static final String RETYPE_PASSWORD = "retypePassword";
		// End Parameter names
		
		
		// Start string messages 
		// Start register page messages
		public static final String SUCCESS_REGISTER_MESSAGE = "Successfully Registered!";
		public static final String ERROR_REGISTER_MESSAGE = "User already exists.";
		public static final String SERVER_ERROR_MESSAGE = "An unexpected server error occurred.";
		public static final String SUCCESS_MESSAGE = "successMessage";
		public static final String ERROR_MESSAGE = "errorMessage";
		// End string messages 
		
		
		// Start login page message
		public static final String SUCCESS_LOGIN_MESSAGE = "Successfully LoggedIn!";
		public static final String ERROR_LOGIN_MESSAGE = "Either username or password is not correct!";
		// End login page message
		
//		public static final String SUCCESS_MESSAGE = "successMessage";
//		public static final String ERROR_MESSAGE = "errorMessage";
		// End string messages
		
		// Start JSP Route
		public static final String LOGIN_PAGE = "/pages/login.jsp";
		public static final String REGISTER_PAGE = "/pages/register.jsp";
		// End JSP Route
		
		// Start Servlet Route
		public static final String REGISTER_SERVLET = "/RegisterServlet";

		public static final String LOGIN_SERVLET = "/LoginServlet";
		// End Servlet Route

		public static final String WELCOME_PAGE = "/pages/welcome.jsp";
		
		
		
		
		
	
	// Start Message
	
	
	// End Message
	
}
