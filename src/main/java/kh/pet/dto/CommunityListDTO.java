package kh.pet.dto;

public class CommunityListDTO {
	
	private int cu_seq;
	private String cu_category_type;
	private String cu_title;
	private String cu_writer;
	private String cu_date;
	private String cu_contents;
	private int cu_view_cnt;
	private String cu_thumb;
	
	public CommunityListDTO() {}
	
	public CommunityListDTO(int cu_seq, String cu_category_type, String cu_title, String cu_writer, String cu_date,
			String cu_contents, int cu_view_cnt, String cu_thumb) {
		super();
		this.cu_seq = cu_seq;
		this.cu_category_type = cu_category_type;
		this.cu_title = cu_title;
		this.cu_writer = cu_writer;
		this.cu_date = cu_date;
		this.cu_contents = cu_contents;
		this.cu_view_cnt = cu_view_cnt;
		this.cu_thumb = cu_thumb;
	}

	public int getCu_seq() {
		return cu_seq;
	}

	public void setCu_seq(int cu_seq) {
		this.cu_seq = cu_seq;
	}

	public String getCu_category_type() {
		return cu_category_type;
	}

	public void setCu_category_type(String cu_category_type) {
		this.cu_category_type = cu_category_type;
	}

	public String getCu_title() {
		return cu_title;
	}

	public void setCu_title(String cu_title) {
		this.cu_title = cu_title;
	}

	public String getCu_writer() {
		return cu_writer;
	}

	public void setCu_writer(String cu_writer) {
		this.cu_writer = cu_writer;
	}

	public String getCu_date() {
		return cu_date;
	}

	public void setCu_date(String cu_date) {
		this.cu_date = cu_date;
	}

	public String getCu_contents() {
		return cu_contents;
	}

	public void setCu_contents(String cu_contents) {
		this.cu_contents = cu_contents;
	}

	public int getCu_view_cnt() {
		return cu_view_cnt;
	}

	public void setCu_view_cnt(int cu_view_cnt) {
		this.cu_view_cnt = cu_view_cnt;
	}

	public String getCu_thumb() {
		return cu_thumb;
	}

	public void setCu_thumb(String cu_thumb) {
		this.cu_thumb = cu_thumb;
	}
	
	
	
	
	
}
