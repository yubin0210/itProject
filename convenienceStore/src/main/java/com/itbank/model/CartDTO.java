package com.itbank.model;

//	IDX         NOT NULL NUMBER        
//	USERID      NOT NULL VARCHAR2(500) 
//	PRODUCT_IDX NOT NULL NUMBER        
//	STORE_IDX   NOT NULL NUMBER        
//	CNT         NOT NULL NUMBER
//  EVENTCNT			 NUMBER

public class CartDTO {
	
	private int idx;
	private String userid;
	private int product_idx;
	private int store_idx;
	private int cnt;
	private int eventcnt;

	public int getEventcnt() {
		return eventcnt;
	}

	public void setEventcnt(int eventcnt) {
		this.eventcnt = eventcnt;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	
	
}
