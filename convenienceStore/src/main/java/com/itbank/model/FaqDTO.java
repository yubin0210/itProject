package com.itbank.model;

//	IDX    NOT NULL NUMBER         
//	WRITER NOT NULL VARCHAR2(500)  
//	TITLE  NOT NULL VARCHAR2(1000) 
//	ANSWER NOT NULL VARCHAR2(4000) 

public class FaqDTO {
	
	private int idx;
	private String title;
	private String answer;
	
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
