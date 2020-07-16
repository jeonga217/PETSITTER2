package kh.pet.dto;

import java.sql.Time;
import java.sql.Timestamp;

public class RegLookupDTO {
	private String reserve_seq;
	private String petsitter_id;
	private String mem_id;
	private int parent_seq;
	private String pet_name;
	private int point;
	private Timestamp start_date;
	private Timestamp end_date;
	private Time time;

	public RegLookupDTO(String reserve_seq, String petsitter_id, String mem_id, int parent_seq, String pet_name,
			int point, Timestamp start_date, Timestamp end_date, Time time) {
		super();
		this.reserve_seq = reserve_seq;
		this.petsitter_id = petsitter_id;
		this.mem_id = mem_id;
		this.parent_seq = parent_seq;
		this.pet_name = pet_name;
		this.point = point;
		this.start_date = start_date;
		this.end_date = end_date;
		this.time = time;
	}

	public String getReserve_seq() {
		return reserve_seq;
	}

	public void setReserve_seq(String reserve_seq) {
		this.reserve_seq = reserve_seq;
	}

	public String getPetsitter_id() {
		return petsitter_id;
	}

	public void setPetsitter_id(String petsitter_id) {
		this.petsitter_id = petsitter_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getParent_seq() {
		return parent_seq;
	}

	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Timestamp getStart_date() {
		return start_date;
	}

	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}

	public Timestamp getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

}
