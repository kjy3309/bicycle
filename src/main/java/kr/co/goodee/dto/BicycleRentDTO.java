package kr.co.goodee.dto;

public class BicycleRentDTO {
	private int br_idx;
	private String br_name;
	private double letitude;
	private double longitude;
	
	public int getBr_idx() {
		return br_idx;
	}
	public void setBr_idx(int br_idx) {
		this.br_idx = br_idx;
	}
	public String getBr_name() {
		return br_name;
	}
	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}
	public double getLetitude() {
		return letitude;
	}
	public void setLetitude(double letitude) {
		this.letitude = letitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
}
