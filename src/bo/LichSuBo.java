package bo;

import java.util.ArrayList;

import bean.LichSubean;
import bean.MonHang;

public class LichSuBo {
	private ArrayList<LichSubean> list;
	
		public LichSuBo() {
		this.list = new ArrayList<LichSubean>();
	}
	
	public ArrayList<LichSubean> getList(){
		return list;
	}
}
