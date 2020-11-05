package kr.co.goodee.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("repl")
public class replDTO {
	
	private int r_idx;
	private String id;
	private int b_idx;
	private String r_comment;
	private Date r_reg_date;
	
	
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getR_comment() {
		return r_comment;
	}
	public void setR_comment(String r_comment) {
		this.r_comment = r_comment;
	}
	public Date getR_reg_date() {
		return r_reg_date;
	}
	public void setR_reg_date(Date r_reg_date) {
		this.r_reg_date = r_reg_date;
	}
	
	

}
