package com.itbank.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

//	IDX      NOT NULL NUMBER        
//	USERID1  NOT NULL VARCHAR2(500) 
//	USERID2  NOT NULL VARCHAR2(500) 
//	CHATDATE          DATE          
//	STATUS            NUMBER    
public class ChatRoomDTO {

	private int idx;
//	private String roomId;
	private String userid1;
	private String userid2;
	private Date chatDate;
	private int status;
	private Set<WebSocketSession> sessions = new HashSet<>();
	
//	public static ChatRoomDTO create(String userid) {
//		ChatRoomDTO room = new ChatRoomDTO();
//		room.roomId = UUID.randomUUID().toString().substring(0, 8);
//		return room;
//	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
//	public String getRoomId() {
//		return roomId;
//	}
//	
//	public void setRoomId(String roomId) {
//		this.roomId = roomId;
//	}
	public String getUserid1() {
		return userid1;
	}
	public void setUserid1(String userid1) {
		this.userid1 = userid1;
	}
	public String getUserid2() {
		return userid2;
	}
	public void setUserid2(String userid2) {
		this.userid2 = userid2;
	}
	public Date getChatDate() {
		return chatDate;
	}
	public void setChatDate(Date chatDate) {
		this.chatDate = chatDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Set<WebSocketSession> getSessions() {
		return sessions;
	}
	public void setSessions(Set<WebSocketSession> sessions) {
		this.sessions = sessions;
	}
	
	
}
