package bo;


public interface DangNhapBO {
	public boolean themTaiKhoan(Object obj);
	public int kiemTraDangNhapKH(String username,String pass);
	public boolean  kiemTraDangNhapAdmin(String username,String pass);
}
