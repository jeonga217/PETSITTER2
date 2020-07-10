package kh.pet.dto;

import java.sql.Timestamp;

public class Stop_memberDTO {
	private int stop_seq;
	private Timestamp stop_start;
	private String stop_id;
	private String stop_reason;
	private int stop_day;
	private String s_stop_day;
	
	public Stop_memberDTO() {}

	public Stop_memberDTO(int stop_seq, Timestamp stop_start, String stop_id, String stop_reason, int stop_day,
			String s_stop_day) {
		super();
		this.stop_seq = stop_seq;
		this.stop_start = stop_start;
		this.stop_id = stop_id;
		this.stop_reason = stop_reason;
		this.stop_day = stop_day;
		this.s_stop_day = s_stop_day;
	}

	public int getStop_seq() {
		return stop_seq;
	}

	public void setStop_seq(int stop_seq) {
		this.stop_seq = stop_seq;
	}

	public Timestamp getStop_start() {
		return stop_start;
	}

	public void setStop_start(Timestamp stop_start) {
		this.stop_start = stop_start;
	}

	public String getStop_id() {
		return stop_id;
	}

	public void setStop_id(String stop_id) {
		this.stop_id = stop_id;
	}

	public String getStop_reason() {
		return stop_reason;
	}

	public void setStop_reason(String stop_reason) {
		this.stop_reason = stop_reason;
	}

	public int getStop_day() {
		return stop_day;
	}

	public void setStop_day(int stop_day) {
		this.stop_day = stop_day;
	}

	public String getS_stop_day() {
		return s_stop_day;
	}

	public void setS_stop_day(String s_stop_day) {
		this.s_stop_day = s_stop_day;
	}
	

}
