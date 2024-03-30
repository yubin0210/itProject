package com.itbank.model;

//	IDX     NOT NULL NUMBER         
//	NAME    NOT NULL VARCHAR2(500)  
//	ADDRESS NOT NULL VARCHAR2(2000) 
//	PNUM             VARCHAR2(100)  
//	LAT     NOT NULL NUMBER         
//	LNG     NOT NULL NUMBER

public class StoreDTO {
	
	private int idx;
	private String name;
	private String address;
	private String pnum;
	private double lat;
	private double lng;
	
	private String gu;
	private String dong;
	
	private double scoreAvg;
	private double distance;
	
	private int likeCount;
	
	

	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public double getScoreAvg() {
		return scoreAvg;
	}
	public void setScoreAvg(double scoreAvg) {
		this.scoreAvg = scoreAvg;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
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
