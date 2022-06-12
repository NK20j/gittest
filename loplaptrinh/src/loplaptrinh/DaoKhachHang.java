package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbConnection.DBConnection;
import model.ModelKhachHang;

public class DaoKhachHang {
	String loginSQL = "select * from khachHang where "
			+ "userName = ? and "
			+ "passWord = sha2(?, 256);";
	
	public ModelKhachHang login(String userName, String passWord) throws SQLException {
		ModelKhachHang mKH = null;
		
		Connection connection  = DBConnection.GET_CONNECTION();
		PreparedStatement ps = connection.prepareStatement(loginSQL);
		ps.setString(1, userName);
		ps.setString(2, passWord);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			mKH = new ModelKhachHang(rs.getInt(1), rs.getString(2), 
					rs.getString(3), rs.getString(4), rs.getString(5), 
					rs.getString(6), rs.getString(7));
		}
		return mKH;
	}
}
