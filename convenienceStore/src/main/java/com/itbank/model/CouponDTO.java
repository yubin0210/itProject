package com.itbank.model;

//IDX       NOT NULL NUMBER         
//TITLE     NOT NULL VARCHAR2(1000) 
//DISCVALUE NOT NULL VARCHAR2(100)  
//VALID     NOT NULL NUMBER    

public class CouponDTO {
	
	private int idx;
	private String title;
	private String discvalue;
	private int valid;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDiscvalue() {
		return discvalue;
	}
	public void setDiscvalue(String discvalue) {
		this.discvalue = discvalue;
	}
	public int getValid() {
		return valid;
	}
	public void setValid(int valid) {
		this.valid = valid;
	}

}
