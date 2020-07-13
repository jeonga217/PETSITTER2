package kh.pet.dto;

public class CurrentPickDTO {
	private String time;
	private String pet_type;
		
	public CurrentPickDTO () {}

	public CurrentPickDTO(String time, String pet_type) {
		this.time = time;
		this.pet_type = pet_type;
	}
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPet_type() {
		return pet_type;
	}

	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}

}
