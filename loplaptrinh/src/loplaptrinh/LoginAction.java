package servletAction;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoKhachHang;
import model.ModelKhachHang;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/loginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");

		System.out.println("\n\n\n\n>>>>>> userName: " + 
						userName + "\tpassWord: " + passWord);

		DaoKhachHang daoKH = new DaoKhachHang();
		ModelKhachHang khachHang = null;
		try {
			khachHang = daoKH.login(userName, passWord);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (khachHang != null) {
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", khachHang);
			
			response.sendRedirect("./homePageAction");
		} else {
			response.sendRedirect("./login.jsp");
		}
	}
}
