package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnection.DBConnection;
import model.ModelChiTietSanPham;
import model.ModelDanhMucSanPham;

@WebServlet("/daoDanhMucSanPham")
public class DaoDanhMucSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String dmsql=("select sanPhamCode, tenSP, giaBan, giamGia from sanpham"); 
    
    public List<ModelDanhMucSanPham>getAllDanhMucSP() throws SQLException{
    	List<ModelDanhMucSanPham> danhMucSPList= new ArrayList<ModelDanhMucSanPham>();
    	Connection connectionsp= DBConnection.GET_CONNECTION();
    	Statement stasp = connectionsp.createStatement();
    	ResultSet rssp = stasp.executeQuery(dmsql);
    	ModelDanhMucSanPham mdmsp=null;
    	while (rssp.next())
    	{
    			mdmsp= new ModelDanhMucSanPham(rssp.getInt(1), rssp.getString(2), rssp.getString(3),
    					rssp.getString(4));
    			danhMucSPList.add(mdmsp);
    }
    	connectionsp.close();
    	return danhMucSPList;
    	
    }
    public static void main(String[] args) throws SQLException {
    	DaoDanhMucSanPham daoSanPham = new DaoDanhMucSanPham();
    	List<ModelDanhMucSanPham> spListdm=  daoSanPham.getAllDanhMucSP();
    	System.out.println(spListdm);
    }
	


}
