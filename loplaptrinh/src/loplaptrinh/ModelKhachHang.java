package model;

public class ModelKhachHang {
	private int khachHangCode;
	private String hoTen;
	private String phone;
	private String diaChi;
	private String email;
	private String userName;
	private String passWord;
	
	public ModelKhachHang(int khachHangCode, String hoTen, String phone, String diaChi, String email, String userName,
			String passWord) {
		super();
		this.khachHangCode = khachHangCode;
		this.hoTen = hoTen;
		this.phone = phone;
		this.diaChi = diaChi;
		this.email = email;
		this.userName = userName;
		this.passWord = passWord;
	}

	public int getKhachHangCode() {
		return khachHangCode;
	}

	public void setKhachHangCode(int khachHangCode) {
		this.khachHangCode = khachHangCode;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	
}
