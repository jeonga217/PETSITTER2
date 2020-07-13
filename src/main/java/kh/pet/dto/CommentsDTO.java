package kh.pet.dto;

public class CommentsDTO {
	private int cm_seq;
	private int cm_parent_seq;
	private String cm_writer;
	private String cm_date;
	private String cm_contents;
	
	
	public int getCm_seq() {
		return cm_seq;
	}
	public void setCm_seq(int cm_seq) {
		this.cm_seq = cm_seq;
	}
	public int getCm_parent_seq() {
		return cm_parent_seq;
	}
	public void setCm_parent_seq(int cm_parent_seq) {
		this.cm_parent_seq = cm_parent_seq;
	}
	public String getCm_writer() {
		return cm_writer;
	}
	public void setCm_writer(String cm_writer) {
		this.cm_writer = cm_writer;
	}
	public String getCm_date() {
		return cm_date;
	}
	public void setCm_date(String cm_date) {
		this.cm_date = cm_date;
	}
	public String getCm_contents() {
		return cm_contents;
	}
	public void setCm_contents(String cm_contents) {
		this.cm_contents = cm_contents;
	}
	
	public CommentsDTO() {}
	
	public CommentsDTO(int cm_seq, int cm_parent_seq, String cm_writer, String cm_date, String cm_contents) {
		super();
		this.cm_seq = cm_seq;
		this.cm_parent_seq = cm_parent_seq;
		this.cm_writer = cm_writer;
		this.cm_date = cm_date;
		this.cm_contents = cm_contents;
	}
	
}
