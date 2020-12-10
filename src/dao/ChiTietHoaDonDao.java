package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ChitiethoadonBean;
import bean.LichSubean;
import jdbc.ThietLap;

public class ChiTietHoaDonDao {
ThietLap database;
	
	public   ChiTietHoaDonDao(){
		database = new ThietLap();
		database.connect();
	}
	public boolean AddChitietHoadon(Object ojb) {
		ChitiethoadonBean CT = (ChitiethoadonBean) ojb;
		 boolean isOk = false;
		 try {
			 String query1 = "INSERT INTO ChiTietHoaDon(MaChiTietHD, MaSach, SoLuongMua, MaHoaDon) VALUES (? , ?, ?, ?)";
			 PreparedStatement c =ThietLap.cn.prepareStatement(query1);
			 c.setString(1, CT.getMaChiTietHD());
			 c.setString(2, CT.getMaSach());
			 c.setInt(3, CT.getSoLuongMua());
			 c.setLong(4,CT.getMaHoaDon());
			 if(c.executeUpdate() ==  1) isOk = true;
		 } catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		
		return isOk;
	}
	public ArrayList<LichSubean> GetDSTheoMaHoaDon(long makh){
		ArrayList<LichSubean> result = new  ArrayList<LichSubean>() ;
		String sql ="select * from ChiTietHoaDon inner join hoadon on ChiTietHoaDon.MaHoaDon = hoadon.MaHoaDon "
				+ "inner join sach on sach.masach = ChiTietHoaDon.MaSach where makh = ?  order by  ChiTietHoaDon.MaHoaDon ASC";
		try {
			PreparedStatement c;
			c = ThietLap.cn.prepareStatement(sql);
			c.setLong(1, makh);
			ResultSet rs = c.executeQuery();
			while(rs.next()) {
				long maHoadon = rs.getLong(4);
				Date ngaymua = rs.getDate(7);
				String tensach = rs.getString(10);
				int soluong = rs.getInt(3);
				long gia = rs.getLong(12);
				result.add(new LichSubean(maHoadon, ngaymua, tensach, soluong, gia));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;	}
}
