package com.itbank.model;

import java.util.Date;

//	IDX         NOT NULL NUMBER         
//	CHAT_IDX    NOT NULL NUMBER         
//	CONTENT     NOT NULL VARCHAR2(2000) 
//	WRITER      NOT NULL VARCHAR2(500)  
//	MESSAGEDATE          DATE 

public class MessageDTO {

	private int idx;
	private int chat_idx;
	private String content;
	private String writer;
	private String nickname;
	private Date messageDate;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getChat_idx() {
		return chat_idx;
	}
	public void setChat_idx(int chat_idx) {
		this.chat_idx = chat_idx;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
}
