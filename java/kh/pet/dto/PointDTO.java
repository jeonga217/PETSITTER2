package kh.pet.dto;

import java.sql.Timestamp;

public class PointDTO {
	private String p_id;
	private int p_point;
	private String p_method;
	private Timestamp p_date;
	private String p_dates;

	public PointDTO() {
	}

	public PointDTO(String p_id, int p_point, String p_method, Timestamp p_date, String p_dates) {
		super();
		this.p_id = p_id;
		this.p_point = p_point;
		this.p_method = p_method;
		this.p_date = p_date;
		this.p_dates = p_dates;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public int getP_point() {
		return p_point;
	}

	public void setP_point(int p_point) {
		this.p_point = p_point;
	}

	public String getP_method() {
		return p_method;
	}

	public void setP_method(String p_method) {
		this.p_method = p_method;
	}

	public Timestamp getP_date() {
		return p_date;
	}

	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}

	public String getP_dates() {
		return p_dates;
	}

	public void setP_dates(String p_dates) {
		this.p_dates = p_dates;
	}

}
