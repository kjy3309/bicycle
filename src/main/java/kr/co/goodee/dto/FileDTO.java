package kr.co.goodee.dto;

import org.apache.ibatis.type.Alias;

@Alias("files")
public class FileDTO {
	private int f_idx; 
	private int id; 
	private int b_idx; 
	private String oriFileName;
	private String newFileName;
	public int getF_idx() {
		return f_idx;
	}
	public void setF_idx(int f_idx) {
		this.f_idx = f_idx;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	
	
}
