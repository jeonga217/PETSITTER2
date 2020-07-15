package kh.pet.dto;

public class timeDTO {
	private int am;
	private int pm;
	
	public timeDTO() {}
	
	public timeDTO(int am, int pm) {
		super();
		this.am = am;
		this.pm = pm;
	}
	
	public int getAm() {
		return am;
	}
	public void setAm(int am) {
		this.am = am;
	}
	public int getPm() {
		return pm;
	}
	public void setPm(int pm) {
		this.pm = pm;
	}
	
	
}
