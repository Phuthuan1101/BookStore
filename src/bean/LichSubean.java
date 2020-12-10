package bean;

import java.sql.Date;
import java.util.ArrayList;

public class LichSubean {
	private long maHoadon;
	private Date ngaymua;
	private String tensach;
	private int soluong;
	private long gia;
	
	public LichSubean() {
		super();
	}
	
	public LichSubean(long maHoadon, Date ngaymua, String tensach,int soluong, long gia) {
		super();
		this.maHoadon = maHoadon;
		this.ngaymua = ngaymua;
		this.tensach = tensach;
		this.soluong = soluong;
		this.gia = gia;
	}
	
	public long getMaHoadon() {
		return maHoadon;
	}
	public void setMaHoadon(long maHoadon) {
		this.maHoadon = maHoadon;
	}
	public Date getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	
}
