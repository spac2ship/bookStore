package dto;

import java.sql.Date;

public class MemberDTO {
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String mem_email;
	private String mem_phone;
	private String mem_add1;
	private String mem_add2;
	private Date join_date;
	
	public MemberDTO() {
    }
	
	
	// 회원가입용 생성자
	public MemberDTO(String mem_id, String mem_pwd, String mem_name, String mem_email,
            String mem_phone, String mem_add1, String mem_add2) {
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_add1 = mem_add1;
		this.mem_add2 = mem_add2;
	}

	// 로그인용 생성자
	public MemberDTO(String mem_id, String mem_pwd) {
        this.mem_id = mem_id;
        this.mem_pwd = mem_pwd;
    }
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_add1() {
		return mem_add1;
	}
	public void setMem_add1(String mem_add1) {
		this.mem_add1 = mem_add1;
	}
	public String getMem_add2() {
		return mem_add2;
	}
	public void setMem_add2(String mem_add2) {
		this.mem_add2 = mem_add2;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
}
