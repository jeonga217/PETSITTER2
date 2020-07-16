package kh.pet.dto;

import java.sql.Date;

public class Mypage_UseTableDTO {
	private String reserve_seq; // 예약 번호
	private String petsitter_board_seq; // 펫시터 시퀀스
	private String petsitter_id; // 펫시터 아이디
	private String mem_id; // 반려인 아이디
	private String pet_name; // 펫이름
	private int reserve_point; // 포인트
	private Date start_day; // 서비스시작날짜
	private Date end_day; // 서비스종료날짜
	private String reserve_time;
	private Date reserve_day; // 현재 날짜

	public Mypage_UseTableDTO() {
	}

	public Mypage_UseTableDTO(String reserve_seq, String petsitter_board_seq, String petsitter_id, String mem_id,
			String pet_name, int reserve_point, Date start_day, Date end_day, String reserve_time, Date reserve_day) {
		super();
		this.reserve_seq = reserve_seq;
		this.petsitter_board_seq = petsitter_board_seq;
		this.petsitter_id = petsitter_id;
		this.mem_id = mem_id;
		this.pet_name = pet_name;
		this.reserve_point = reserve_point;
		this.start_day = start_day;
		this.end_day = end_day;
		this.reserve_time = reserve_time;
		this.reserve_day = reserve_day;
	}

	public String getReserve_seq() {
		return reserve_seq;
	}

	public void setReserve_seq(String reserve_seq) {
		this.reserve_seq = reserve_seq;
	}

	public String getPetsitter_board_seq() {
		return petsitter_board_seq;
	}

	public void setPetsitter_board_seq(String petsitter_board_seq) {
		this.petsitter_board_seq = petsitter_board_seq;
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

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public int getReserve_point() {
		return reserve_point;
	}

	public void setReserve_point(int reserve_point) {
		this.reserve_point = reserve_point;
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

	public String getReserve_time() {
		return reserve_time;
	}

	public void setReserve_time(String reserve_time) {
		this.reserve_time = reserve_time;
	}

	public Date getReserve_day() {
		return reserve_day;
	}

	public void setReserve_day(Date reserve_day) {
		this.reserve_day = reserve_day;
	}

}
