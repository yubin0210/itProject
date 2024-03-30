package com.itbank.model;

//	IDX         NOT NULL NUMBER 
//	PRODUCT_IDX NOT NULL NUMBER 
//	STORE_IDX   NOT NULL NUMBER 
//	CNT         NOT NULL NUMBER

public class InventoryDTO {
	
	private int idx;
	private int product_idx;
	private int store_idx;
	private int cnt;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
