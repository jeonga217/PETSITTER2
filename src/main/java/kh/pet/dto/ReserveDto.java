package kh.pet.dto;

public class ReserveDto {
	private String reserve_seq;
	private String petsitter_board_seq;
	private String petsitter_id;
	private String mem_id;
	private String pet_name; 
	private int reserve_point; 
	private String reserve_sdate;
	private String reserve_edate;
	private String reserve_time;
	
	public ReserveDto() {
	}

	public ReserveDto(String reserve_seq, String petsitter_board_seq, String petsitter_id, String mem_id,
			String pet_name, int reserve_point, String reserve_sdate, String reserve_edate, String reserve_time) {
		super();
		this.reserve_seq = reserve_seq;
		this.petsitter_board_seq = petsitter_board_seq;
		this.petsitter_id = petsitter_id;
		this.mem_id = mem_id;
		this.pet_name = pet_name;
		this.reserve_point = reserve_point;
		this.reserve_sdate = reserve_sdate;
		this.reserve_edate = reserve_edate;
		this.reserve_time = reserve_time;
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

	public String getReserve_sdate() {
		return reserve_sdate;
	}

	public void setReserve_sdate(String reserve_sdate) {
		this.reserve_sdate = reserve_sdate;
	}

	public String getReserve_edate() {
		return reserve_edate;
	}

	public void setReserve_edate(String reserve_edate) {
		this.reserve_edate = reserve_edate;
	}

	public String getReserve_time() {
		return reserve_time;
	}

	public void setReserve_time(String reserve_time) {
		this.reserve_time = reserve_time;
	}
	
}
