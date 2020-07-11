package kh.pet.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MemboardDto {
	private String mb_seq;
	private String mb_title;
	private String mb_writer;
	private Timestamp mb_date;
	private String mb_pet_name;
	private String mb_service;
	private String mb_startday;
	private String mb_endday;
	private String mb_stime;
	private String mb_etime;
	private String mb_request;
	private String mb_point;
	private String mb_petphoto;
	private String mb_boardstatus;
	private String mb_restatus;
	private String mb_booker;
	private String[] photo;
	private String date;
	
	public MemboardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemboardDto(String mb_seq, String mb_title, String mb_writer, Timestamp mb_date, String mb_pet_name,
			String mb_service, String mb_startday, String mb_endday, String mb_stime, String mb_etime, String mb_request,
			String mb_point, String mb_petphoto, String mb_boardstatus, String mb_restatus, String mb_booker,
			String[] photo, String date) {
		super();
		this.mb_seq = mb_seq;
		this.mb_title = mb_title;
		this.mb_writer = mb_writer;
		this.mb_date = mb_date;
		this.mb_pet_name = mb_pet_name;
		this.mb_service = mb_service;
		this.mb_startday = mb_startday;
		this.mb_endday = mb_endday;
		this.mb_stime = mb_stime;
		this.mb_etime = mb_etime;
		this.mb_request = mb_request;
		this.mb_point = mb_point;
		this.mb_petphoto = mb_petphoto;
		this.mb_boardstatus = mb_boardstatus;
		this.mb_restatus = mb_restatus;
		this.mb_booker = mb_booker;
		this.photo = photo;
		this.date = new SimpleDateFormat("YYYY-MM-dd").format(mb_date);
	}

	public String getMb_seq() {
		return mb_seq;
	}

	public void setMb_seq(String mb_seq) {
		this.mb_seq = mb_seq;
	}

	public String getMb_title() {
		return mb_title;
	}

	public void setMb_title(String mb_title) {
		this.mb_title = mb_title;
	}

	public String getMb_writer() {
		return mb_writer;
	}

	public void setMb_writer(String mb_writer) {
		this.mb_writer = mb_writer;
	}

	public Timestamp getMb_date() {
		return mb_date;
	}

	public void setMb_date(Timestamp mb_date) {
		this.mb_date = mb_date;
	}

	public String getMb_pet_name() {
		return mb_pet_name;
	}

	public void setMb_pet_name(String mb_pet_name) {
		this.mb_pet_name = mb_pet_name;
	}

	public String getMb_service() {
		return mb_service;
	}

	public void setMb_service(String mb_service) {
		this.mb_service = mb_service;
	}

	public String getMb_startday() {
		return mb_startday;
	}

	public void setMb_startday(String mb_startday) {
		this.mb_startday = mb_startday;
	}

	public String getMb_endday() {
		return mb_endday;
	}

	public void setMb_endday(String mb_endday) {
		this.mb_endday = mb_endday;
	}

	public String getMb_stime() {
		return mb_stime;
	}

	public void setMb_stime(String mb_stime) {
		this.mb_stime = mb_stime;
	}

	public String getMb_etime() {
		return mb_etime;
	}

	public void setMb_etime(String mb_etime) {
		this.mb_etime = mb_etime;
	}

	public String getmb_request() {
		return mb_request;
	}

	public void setmb_request(String mb_request) {
		this.mb_request = mb_request;
	}

	public String getMb_point() {
		return mb_point;
	}

	public void setMb_point(String mb_point) {
		this.mb_point = mb_point;
	}

	public String getMb_petphoto() {
		return mb_petphoto;
	}

	public void setMb_petphoto(String mb_petphoto) {
		this.mb_petphoto = mb_petphoto;
	}

	public String getMb_boardstatus() {
		return mb_boardstatus;
	}

	public void setMb_boardstatus(String mb_boardstatus) {
		this.mb_boardstatus = mb_boardstatus;
	}

	public String getMb_restatus() {
		return mb_restatus;
	}

	public void setMb_restatus(String mb_restatus) {
		this.mb_restatus = mb_restatus;
	}

	public String getMb_booker() {
		return mb_booker;
	}

	public void setMb_booker(String mb_booker) {
		this.mb_booker = mb_booker;
	}

	public String[] getPhoto() {
		return photo;
	}

	public void setPhoto(String[] photo) {
		this.photo = photo;
	}
	
	public String getdate() {
		long mb_date = this.mb_date.getTime();//글 작성 시점
		long current_date = System.currentTimeMillis();// 현재 시점
		
		long gapTime = (current_date - mb_date)/1000;
		
		if(gapTime<60) {
			return "방금전";
		}else if(gapTime<300) {
			return "5분 이내";
		}else if(gapTime<3600) {
			return "1시간 이내";
		}else if(gapTime<86400) {
			return "24시간 이내";
		}else {
			return date;
		}
	}
	
}
