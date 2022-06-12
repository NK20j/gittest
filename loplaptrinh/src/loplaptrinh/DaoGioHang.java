package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import dbConnection.DBConnection;

public class DaoGioHang {
	int SPcode;
	String tenSP;
	int soLuong;
	private String hoTenKH;
	private String phone;
	private String email;
	private String address;
	private String userNameLogin;
	private String passwordLogin;
	Connection consp = null;
	Statement stmt = null;

	public void update(int SPcode, String tenSP, int soLuong, String hoTenKH, String phone, String address,
			String email, String userNameLogin, String passwordLogin) {
		this.SPcode = SPcode;
		this.tenSP = tenSP;
		this.soLuong = soLuong;
		this.hoTenKH = hoTenKH;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.userNameLogin = userNameLogin;
		this.passwordLogin = passwordLogin;

		System.out.println(this.SPcode);// test giá trị gửi về
		System.out.println(this.tenSP);
		System.out.println(this.soLuong);
		System.out.println(this.hoTenKH);
		System.out.println(this.email);
		System.out.println(this.address);
		System.out.println(this.userNameLogin);
		System.out.println(this.passwordLogin);
		try {

			consp = DBConnection.GET_CONNECTION();
			String upsql = "insert into giohang(SPcode,tenSP,soLuong, hotenKH, "
					+ "phone,address, email, userName, passWord) values (?,?,?,?,?,?,?,?,?)";
			// stmt = consp.createStatement();// what is this?
			PreparedStatement stmt = consp.prepareStatement(upsql);
			stmt.setInt(1, this.SPcode);
			stmt.setString(2, this.tenSP);
			stmt.setInt(3, this.soLuong);
			stmt.setString(4, this.hoTenKH);
			stmt.setString(5, this.phone);
			stmt.setString(6, this.address);
			stmt.setString(7, this.email);
			stmt.setString(8, this.userNameLogin);
			stmt.setString(9, this.passwordLogin);
			stmt.executeUpdate();
			consp.close();

			// DBConnection.CLOST_CONNECTION();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
