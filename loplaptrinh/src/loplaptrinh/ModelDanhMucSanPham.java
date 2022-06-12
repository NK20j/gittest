package model;

public class ModelDanhMucSanPham {
int sanPhamCode;
String tenSP;
String giaBan;
String giamGia;


public ModelDanhMucSanPham(int sanPhamCode, String tenSP, String giaBan, String giamGia) {
	// TODO Auto-generated constructor stub
	
	this.sanPhamCode = sanPhamCode;
	this.tenSP = tenSP;
	this.giaBan = giaBan;
	this.giamGia = giamGia;
	
}
public int getSanPhamCode() {
	return sanPhamCode;
}
public void setSanPhamCode(int sanPhamCode) {
	this.sanPhamCode = sanPhamCode;
}
public String getTenSP() {
	return tenSP;
}
public void setTenSP(String tenSP) {
	this.tenSP = tenSP;
}
public String getGiaBan() {
	return giaBan;
}
public void setGiaBan(String giaBan) {
	this.giaBan = giaBan;
}
public String getGiamGia() {
	return giamGia;
}
public void setGiamGia(String giamGia) {
	this.giamGia = giamGia;
}


}

