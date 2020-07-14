package kh.pet.dto;

import java.sql.Date;

public class Visitor_countDTO {
	private Date v_date;
	private int v_count;
	
	public Visitor_countDTO() {}
	
	public Visitor_countDTO(Date v_date, int v_count) {
		super();
		this.v_date = v_date;
		this.v_count = v_count;
	}
	public Date getV_date() {
		return v_date;
	}
	public void setV_date(Date v_date) {
		this.v_date = v_date;
	}
	public int getV_count() {
		return v_count;
	}
	public void setV_count(int v_count) {
		this.v_count = v_count;
	}
	
}
