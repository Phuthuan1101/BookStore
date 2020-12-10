package bean;

public class AdminBean {
	
private String tenDN;
private String pass;
private boolean quyen;
	   
  public AdminBean() {
			super();
		}
   public AdminBean(String tenDN, String pass, boolean quyen) {
		super();
		this.tenDN = tenDN;
		this.pass = pass;
		this.quyen = quyen;
	}
   public String getTenDN() {
		return tenDN;
	}
	public void setTenDN(String tenDN) {
		this.tenDN = tenDN;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public boolean isQuyen() {
		return quyen;
	}
	public void setQuyen(boolean quyen) {
		this.quyen = quyen;
	}
  
}
