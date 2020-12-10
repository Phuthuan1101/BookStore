package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.HoaDon;
import bean.LoaiSach;
import bean.Sach;
import jdbc.ThietLap;

public class GiaodienDao {
	ThietLap database;
	
 public  GiaodienDao() {
	 database = new ThietLap();
		database.connect();
 }
 // lay loai sach
 public ArrayList<LoaiSach> getloaisach(){
	 ArrayList<LoaiSach> result = new ArrayList<LoaiSach>();
	 String sql = "select  maloai from loai";
		PreparedStatement  c ;
		try {
			c = ThietLap.cn.prepareStatement(sql);
			ResultSet rs = c.executeQuery();
			while(rs.next())
			{
				String tenloai = rs.getNString(1);
				result.add(new LoaiSach(tenloai));
			}
		} catch (Exception e) {
			e.printStackTrace(); // in lỗi ra
		}
		return result;
 }
// xoa sach
 
 
}
