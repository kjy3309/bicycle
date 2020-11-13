package kr.co.goodee.dto;

public class ProMemberDTO {
	private String id;
	private String pw;
	private String name;
	private int birth;
	private String status;
	private String email;
	private String msg;
	private boolean idChk;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int age) {
		this.birth = age;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String gender) {
		this.status = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public boolean isIdChk() {
		return idChk;
	}
	public void setIdChk(boolean idChk) {
		this.idChk = idChk;
	}
}
