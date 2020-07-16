package kh.pet.dto;

public class Mypage_MemberDTO {
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_eamil;
	private String mem_phone;
	private int mem_zipcode;
	private String mem_address1;
	private String mem_address2;
	private String mem_have_pet;
	private String mem_type;
	private String mem_join_type;
	private String mem_join_date;

	public Mypage_MemberDTO(String mem_id, String mem_pw, String mem_name, String mem_eamil, String mem_phone,
			int mem_zipcode, String mem_address1, String mem_address2, String mem_have_pet, String mem_type,
			String mem_join_type, String mem_join_date) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_eamil = mem_eamil;
		this.mem_phone = mem_phone;
		this.mem_zipcode = mem_zipcode;
		this.mem_address1 = mem_address1;
		this.mem_address2 = mem_address2;
		this.mem_have_pet = mem_have_pet;
		this.mem_type = mem_type;
		this.mem_join_type = mem_join_type;
		this.mem_join_date = mem_join_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_eamil() {
		return mem_eamil;
	}

	public void setMem_eamil(String mem_eamil) {
		this.mem_eamil = mem_eamil;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public int getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(int mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

	public String getMem_address1() {
		return mem_address1;
	}

	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}

	public String getMem_address2() {
		return mem_address2;
	}

	public void setMem_address2(String mem_address2) {
		this.mem_address2 = mem_address2;
	}

	public String getMem_have_pet() {
		return mem_have_pet;
	}

	public void setMem_have_pet(String mem_have_pet) {
		this.mem_have_pet = mem_have_pet;
	}

	public String getMem_type() {
		return mem_type;
	}

	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}

	public String getMem_join_type() {
		return mem_join_type;
	}

	public void setMem_join_type(String mem_join_type) {
		this.mem_join_type = mem_join_type;
	}

	public String getMem_join_date() {
		return mem_join_date;
	}

	public void setMem_join_date(String mem_join_date) {
		this.mem_join_date = mem_join_date;
	}

}
