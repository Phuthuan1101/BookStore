package bean;
/*
 * Cai ni dang le nen dung cai gio hang luon...ma gio hang thi phai them mot so thuoc tinh nua...cho han day du nhu trong database
 * 
 * */

import java.sql.Date;

public class HoaDon {
	
	public HoaDon() {
		super();
	}
	private long maHoaDon;
	private long makh;
	private Date ngayMua;
	private boolean damua;
	public HoaDon(long maHoaDon,long makh, Date ngayMua, boolean damua) {
		super();
		this.maHoaDon = maHoaDon;
		this.makh = makh;
		this.ngayMua = ngayMua;
		this.damua = damua;
	}
	
	/**
	 * Hàm tạo này chỉ để dùng cho add dữ liệu vào table hóa  đơn 
	 * @param makh
	 * @param damua
	 */
	public HoaDon(long makh, boolean damua) {
		this.makh = makh;
		this.damua = damua;
	}
	
	
	public long getMaHoaDon() {
		return maHoaDon;
	}
	public void setMaHoaDon(long maHoaDon) {
		maHoaDon = maHoaDon;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public Date getNgayMua() {
		return ngayMua;
	}
	public void setNgayMua(Date ngayMua) {
		ngayMua = ngayMua;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	

}
