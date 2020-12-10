package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;



import bean.AdminBean;
import bean.KhachHangBean;
import bean.LoaiSach;
import bo.DangNhapBO;
import jdbc.ThietLap;

public class XuLyDao implements DangNhapBO{
	ThietLap database;
	
	public  XuLyDao() {
		database = new ThietLap();
		database.connect();
		
	}
	
	@Override
	public boolean themTaiKhoan(Object obj) {
	KhachHangBean kh = (KhachHangBean) obj;
	boolean result = false;
	 try {
		 String sql ="INSERT INTO KhachHang(hoten,diachi,sodt,email,tendn,pass) VALUES( ?, ?, ?, ? ,? ,?)";
		 PreparedStatement c = ThietLap.cn.prepareStatement(sql);
//		 c.setString(1, kh.getMakh());
		 c.setString(1, kh.getHoten());
		 c.setString(2, kh.getAddress());
		 c.setString(3, kh.getPhone());
		 c.setString(4, kh.getEmail());
		 c.setString(5, kh.getTenDN());
		 c.setString(6, kh.getPass());
		 if(c.executeUpdate() == 1) result = true;
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("Loi khi them");
	}
		return result;
	}
   
	public  KhachHangBean SetInfoKH(String username, String pass) {
		KhachHangBean kh = new KhachHangBean();
		String find = "SELECT * FROM KhachHang where tendn = ? and pass = ? ";
		PreparedStatement c;
		try {
			c = ThietLap.cn.prepareStatement(find);
			c.setString(1, username);
			c.setString(2, pass);
			ResultSet rs = c.executeQuery();
			while(rs.next()) {
				long mkh =rs.getLong("makh");
				String name = rs.getNString(2);
				String address = rs.getString(3);
				String phone = rs.getString(4);
				String email = rs.getString(5);
				String user = rs.getString(6);
				String password = rs.getString(7);
			
			return new KhachHangBean(mkh,name,user,password,phone,email,address);				
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return null;
	}
	
@Override
public int  kiemTraDangNhapKH(String username,String pass) {
		int temp =-1;  // ko có account này trong database
		String find = "SELECT * FROM KhachHang where tendn = ?";
		PreparedStatement c;
	try {
		 c = ThietLap.cn.prepareStatement(find);
		 c.setString(1, username);
		ResultSet rs = c.executeQuery();
		if(rs.next()) {
			temp = 0;  //có account này
			if(rs.getString(7).trim().equals(pass)) temp = 1; // đúng pass
		}
	} catch (Exception e) {
		System.out.println("Loi tim ma!");
		e.printStackTrace();
	}
	return temp;
	
}


@Override
public boolean  kiemTraDangNhapAdmin(String username,String pass) {
	try {
		String find = "SELECT * FROM DangNhap where TenDangNhap = ? and matkhau = ?";
		PreparedStatement c = ThietLap.cn.prepareStatement(find);
		c.setString(1, username);
		c.setString(2, pass);
		ResultSet rs = c.executeQuery();
		if(rs.next()) {
			System.out.println("Tồn tại admin trong csdl");
			return true;
		}
	} catch (Exception e) {
		System.out.println("Đăng nhập thất bại");
		e.printStackTrace();

	}
	return false;
	
}
	/* public boe */

public boolean  kiemTraEmail(String email ) {
	try {
		String find = "SELECT * FROM KhachHang where email = ?";
		PreparedStatement c = ThietLap.cn.prepareStatement(find);
		c.setString(1, email);
		ResultSet rs = c.executeQuery();
		if(rs.next()) {
			if(rs.getString(5).equals(email) ) {	
				return true;
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return false;
	
}
public boolean  kiemTraTenDn(String tendn) {
	try {
		String find = "SELECT * FROM  KhachHang where tendn = ?";
		PreparedStatement c = ThietLap.cn.prepareStatement(find);
		c.setString(1, tendn);
		ResultSet rs = c.executeQuery();
		if(rs.next()) {
			if(rs.getString(6).equals(tendn) ) {	
				return true;
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return false;
	
}
public boolean  kiemTraSoDT(String  phone ) {
	try {
		String find = "SELECT * FROM  KhachHang where sodt = ?";
		PreparedStatement c = ThietLap.cn.prepareStatement(find);
		c.setString(1, phone);
		ResultSet rs = c.executeQuery();
		if(rs.next()) {
			if(rs.getString(4).equals(phone) ) {	
				return true;
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return false;
	
}

public  AdminBean SetInfoAdmin(String username) {
	AdminBean admin = new AdminBean();
	try {
		String find = "SELECT * FROM DangNhap where TenDangNhap = ? ";
		PreparedStatement c = ThietLap.cn.prepareStatement(find);
		c.setString(1, username);
		ResultSet rs = c.executeQuery();
		while(rs.next()) {
			String name = rs.getNString(1);
			String pass = rs.getString(2);
			boolean quyen = rs.getBoolean(3);
		
		return new AdminBean(name, pass, quyen);				
		}
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	
	return null;
}




//public boolean them(HoadonBean order) {
//	boolean result = false;
//	try {
//		String sql = "insert into HoadonBean(DateCreated, Nickname, DeliveryDate, ShipInfo, DiscountCode) values (?, ?, ?, ?, ?)";
//		PreparedStatement c = ThietLap.cn.prepareStatement(sql);
//		c.setDate(1, order.getDateCreated());//manv
//		c.setString(2, order.getNickname()); // hoten
//		c.setDate(3, order.getDeliveryDate()); // ngaysinh
//		c.setNString(4, order.getShipInfo()); //true = nam , false = nu
//		c.setString(5, order.getDiscountCode()); // madv
//		if(c.executeUpdate() == 1) result = true;
//	} catch (Exception e) {
//		System.out.println("Loi khi them");
//		e.printStackTrace();
//	} 
//	return result;
//}




}
