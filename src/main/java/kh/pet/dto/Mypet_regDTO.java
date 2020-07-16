package kh.pet.dto;

public class Mypet_regDTO {
	private int petseq; //시퀀스
	private String master_id; // 아이디
	private String pet_name; // 펫이름
	private String pet_photo; // 이미지
	private String pet_gender; // 성별
	private String pet_ox; // 중성화
	private int pet_age; // 펫나이
	private String pet_animal; // 개인지 고양인지
	private String pet_type; // 소,중,대
	private String pet_sort; // 펫 종류
	private String pet_family; // 동거여부
	private String pet_character; // 성격
	private String pet_details; // 상세설명

	public Mypet_regDTO() {
	}

	public Mypet_regDTO(int petseq, String master_id, String pet_name, String pet_photo, String pet_gender,
			String pet_ox, int pet_age, String pet_animal, String pet_type, String pet_sort, String pet_family,
			String pet_character, String pet_details) {
		super();
		this.petseq = petseq;
		this.master_id = master_id;
		this.pet_name = pet_name;
		this.pet_photo = pet_photo;
		this.pet_gender = pet_gender;
		this.pet_ox = pet_ox;
		this.pet_age = pet_age;
		this.pet_animal = pet_animal;
		this.pet_type = pet_type;
		this.pet_sort = pet_sort;
		this.pet_family = pet_family;
		this.pet_character = pet_character;
		this.pet_details = pet_details;
	}

	public int getPetseq() {
		return petseq;
	}

	public void setPetseq(int petseq) {
		this.petseq = petseq;
	}

	public String getMaster_id() {
		return master_id;
	}

	public void setMaster_id(String master_id) {
		this.master_id = master_id;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public String getPet_photo() {
		return pet_photo;
	}

	public void setPet_photo(String pet_photo) {
		this.pet_photo = pet_photo;
	}

	public String getPet_gender() {
		return pet_gender;
	}

	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}

	public String getPet_ox() {
		return pet_ox;
	}

	public void setPet_ox(String pet_ox) {
		this.pet_ox = pet_ox;
	}

	public int getPet_age() {
		return pet_age;
	}

	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}

	public String getPet_animal() {
		return pet_animal;
	}

	public void setPet_animal(String pet_animal) {
		this.pet_animal = pet_animal;
	}

	public String getPet_type() {
		return pet_type;
	}

	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}

	public String getPet_sort() {
		return pet_sort;
	}

	public void setPet_sort(String pet_sort) {
		this.pet_sort = pet_sort;
	}

	public String getPet_family() {
		return pet_family;
	}

	public void setPet_family(String pet_family) {
		this.pet_family = pet_family;
	}

	public String getPet_character() {
		return pet_character;
	}

	public void setPet_character(String pet_character) {
		this.pet_character = pet_character;
	}

	public String getPet_details() {
		return pet_details;
	}

	public void setPet_details(String pet_details) {
		this.pet_details = pet_details;
	}

	
	
}
