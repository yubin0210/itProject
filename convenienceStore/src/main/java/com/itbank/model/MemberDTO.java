package com.itbank.model;

//IDX      NOT NULL NUMBER        
//USERID   NOT NULL VARCHAR2(500) 
//USERPW   NOT NULL VARCHAR2(500) 
//EMAIL    NOT NULL VARCHAR2(500) 
//NICKNAME NOT NULL VARCHAR2(500) 
//ROLE     NOT NULL NUMBER   

public class MemberDTO {

	private int idx;
	private String userid;
	private String userpw;
	private String email;
	private String nickname;
	private int role;
	
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
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	
}
