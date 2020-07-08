package kh.pet.dto;

public class WaitlistDTO {
	private int seq;
	private String board_seq;
	private String petsitter_id;
	private String mem_id;
	private String pet_name;
	private String rsv_point;
	private String rsv_start_day;
	private String rsv_end_day;
	private String psb_time;
	
	public WaitlistDTO() {}

	public WaitlistDTO(int seq, String board_seq, String petsitter_id, String mem_id, String pet_name, String rsv_point,
			String rsv_start_day, String rsv_end_day, String psb_time) {
		super();
		this.seq = seq;
		this.board_seq = board_seq;
		this.petsitter_id = petsitter_id;
		this.mem_id = mem_id;
		this.pet_name = pet_name;
		this.rsv_point = rsv_point;
		this.rsv_start_day = rsv_start_day;
		this.rsv_end_day = rsv_end_day;
		this.psb_time = psb_time;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
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

	public String getRsv_point() {
		return rsv_point;
	}

	public void setRsv_point(String rsv_point) {
		this.rsv_point = rsv_point;
	}

	public String getRsv_start_day() {
		return rsv_start_day;
	}

	public void setRsv_start_day(String rsv_start_day) {
		this.rsv_start_day = rsv_start_day;
	}

	public String getRsv_end_day() {
		return rsv_end_day;
	}

	public void setRsv_end_day(String rsv_end_day) {
		this.rsv_end_day = rsv_end_day;
	}

	public String getPsb_time() {
		return psb_time;
	}

	public void setPsb_time(String psb_time) {
		this.psb_time = psb_time;
	}
	
	
	
}	
