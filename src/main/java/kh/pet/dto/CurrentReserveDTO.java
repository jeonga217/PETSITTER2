package kh.pet.dto;

import java.sql.Date;

public class CurrentReserveDTO {
	private String parent_board_seq;
	private Date cur_date;
	private String s_cur_date;
	private int am;
	private int pm;
	
	public CurrentReserveDTO() {}


	public CurrentReserveDTO(String parent_board_seq, Date cur_date, String s_cur_date, int am, int pm) {
		super();
		this.parent_board_seq = parent_board_seq;
		this.cur_date = cur_date;
		this.s_cur_date = s_cur_date;
		this.am = am;
		this.pm = pm;
	}
	
	public String getParent_board_seq() {
		return parent_board_seq;
	}

	public void setParent_board_seq(String parent_board_seq) {
		this.parent_board_seq = parent_board_seq;
	}

	public Date getCur_date() {
		return cur_date;
	}

	public void setCur_date(Date cur_date) {
		this.cur_date = cur_date;
	}

	public String getS_cur_date() {
		return s_cur_date;
	}

	public void setS_cur_date(String s_cur_date) {
		this.s_cur_date = s_cur_date;
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
