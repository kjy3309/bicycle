package kr.co.goodee.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("real_remain")
public class RdataDTO {
	private int br_idx;
	private int remain;
	private String remain_time;
	private Date remain_reg_date;
	
	public int getBr_idx() {
		return br_idx;
	}
	public void setBr_idx(int br_idx) {
		this.br_idx = br_idx;
	}
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	public String getRemain_time() {
		return remain_time;
	}
	public void setRemain_time(String remain_time) {
		this.remain_time = remain_time;
	}
	public Date getRemain_reg_date() {
		return remain_reg_date;
	}
	public void setRemain_reg_date(Date remain_reg_date) {
		this.remain_reg_date = remain_reg_date;
	}
	
	
}
