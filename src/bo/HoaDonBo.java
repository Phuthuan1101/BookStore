package bo;

import java.util.ArrayList;

import bean.HoaDon;
import dao.HoaDonDao;

public class HoaDonBo {
	HoaDonDao dao = new  HoaDonDao();
	public  ArrayList<HoaDon> getHoaDon(Long username){
		return dao.timKiemTheoUser(username);//tryền từ khách mà ko 
	}
	
}
