package kh.pet.dto;

import java.sql.Date;

public class CurrentPickDTO {
	
	private String parent_board_seq;
	private String time;
	private int pets;
	private Date start_day;
	private Date end_day;
	
	public CurrentPickDTO() {}
	
	public CurrentPickDTO(String parent_board_seq, String time, int pets, Date start_day, Date end_day) {
		super();
		this.parent_board_seq = parent_board_seq;
		this.time = time;
		this.pets = pets;
		this.start_day = start_day;
		this.end_day = end_day;
	}

	public String getParent_board_seq() {
		return parent_board_seq;
	}

	public void setParent_board_seq(String parent_board_seq) {
		this.parent_board_seq = parent_board_seq;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getPets() {
		return pets;
	}

	public void setPets(int pets) {
		this.pets = pets;
	}

	public Date getStart_day() {
		return start_day;
	}

	public void setStart_day(Date start_day) {
		this.start_day = start_day;
	}

	public Date getEnd_day() {
		return end_day;
	}

	public void setEnd_day(Date end_day) {
		this.end_day = end_day;
	}
	
	
}
