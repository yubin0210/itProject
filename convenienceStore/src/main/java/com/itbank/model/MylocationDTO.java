package com.itbank.model;

//	IDX        NOT NULL NUMBER         
//	MEMBER_IDX NOT NULL NUMBER         
//	ADDRESS    NOT NULL VARCHAR2(2000) 
//	LAT        NOT NULL NUMBER         
//	LNG        NOT NULL NUMBER

public class MylocationDTO {
	
	private int idx;
	private int member_idx;
	private String address;
	private double lat;
	private double lng;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	
	
	

}
