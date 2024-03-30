package com.itbank.model;

import java.sql.Date;

//	IDX        NOT NULL NUMBER         
//	STORE_IDX  NOT NULL NUMBER         
//	USERID     NOT NULL VARCHAR2(500)  
//	SCORE               NUMBER         
//	CONTENT    NOT NULL VARCHAR2(4000) 
//	REVIEWDATE          DATE

public class StoreReviewDTO {
	
	private int idx;
	private int sotre_idx;
	private String userid;
	private int score;
	private String content;
	private Date reviewDate;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getSotre_idx() {
		return sotre_idx;
	}
	public void setSotre_idx(int sotre_idx) {
		this.sotre_idx = sotre_idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	
}
