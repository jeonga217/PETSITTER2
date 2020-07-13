package kh.pet.dto;

public class ReportDTO {

	private int report_seq;
	private int r_parent_seq;
	private String parents_seq;
	private String report_contents;
	private String report_id;
	
	public ReportDTO() {}

	public ReportDTO(int report_seq, int r_parent_seq, String parents_seq, String report_contents, String report_id) {
		super();
		this.report_seq = report_seq;
		this.r_parent_seq = r_parent_seq;
		this.parents_seq = parents_seq;
		this.report_contents = report_contents;
		this.report_id = report_id;
	}

	public int getReport_seq() {
		return report_seq;
	}

	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}

	public int getR_parent_seq() {
		return r_parent_seq;
	}

	public void setR_parent_seq(int r_parent_seq) {
		this.r_parent_seq = r_parent_seq;
	}

	public String getParents_seq() {
		return parents_seq;
	}

	public void setParents_seq(String parents_seq) {
		this.parents_seq = parents_seq;
	}

	public String getReport_contents() {
		return report_contents;
	}

	public void setReport_contents(String report_contents) {
		this.report_contents = report_contents;
	}

	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	
}
