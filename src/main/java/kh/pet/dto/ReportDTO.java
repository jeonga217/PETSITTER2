package kh.pet.dto;

public class ReportDTO {

	private int report_seq;
	private int r_parent_seq;
	private String report_contents;
	private String report_id;
	private String report_target;
	private int report_type;
	
	public ReportDTO() {}


	public ReportDTO(int report_seq, int r_parent_seq, String report_contents, String report_id, String report_target,
			int report_type) {

		super();
		this.report_seq = report_seq;
		this.r_parent_seq = r_parent_seq;
		this.report_contents = report_contents;
		this.report_id = report_id;
		this.report_target = report_target;
		this.report_type = report_type;
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

	public String getReport_target() {
		return report_target;
	}

	public void setReport_target(String report_target) {
		this.report_target = report_target;
	}

	public int getReport_type() {
		return report_type;
	}

	public void setReport_type(int report_type) {
		this.report_type = report_type;
	}
	
		
	
}
