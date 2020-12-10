package bo;

import java.util.ArrayList;

import bean.LoaiSach;
import dao.GiaodienDao;

public class GiaodienBo {
	GiaodienDao dao = new GiaodienDao();
	public ArrayList<LoaiSach> getloaiSach(){
		return dao.getloaisach();
	}

}
