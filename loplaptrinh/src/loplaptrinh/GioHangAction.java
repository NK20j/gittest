package servletAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoGioHang;
import model.ModelKhachHang;

/**
 * Servlet implementation class UpdateAction
 */
@WebServlet("/updateAction")
public class GioHangAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int SPcode = 0, soLuong = 0;
		DaoGioHang upd = new DaoGioHang();
		String SPc = request.getParameter("product's code");
		if (SPc != null) {
			SPcode = Integer.parseInt(SPc);
		} else
			SPcode = 0;

		String tenSP = request.getParameter("product's name");

		String sl = request.getParameter("quantity");
		if (sl != null) {
			soLuong = Integer.parseInt(sl);
		} else {
			soLuong = 0;
		}
		
		String hoTenKH = request.getParameter("customer's name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");

		ModelKhachHang khachHang = (ModelKhachHang) request.getSession().getAttribute("currentUser");

		String userNameLogin = khachHang.getUserName();
		String passwordLogin = khachHang.getPassWord();

		if (SPcode > 0 && soLuong > 0 && hoTenKH != null && phone != null && address != null) {
			upd.update(SPcode, tenSP, soLuong, hoTenKH, phone, email, address, userNameLogin, passwordLogin);
			response.sendRedirect("./homePageAction");

		} else {
			System.out.println("thiếu dữ liệu không thể nhập vào giỏ hàng ");
			response.sendRedirect("./addproduct.jsp");

		}
	}
}
