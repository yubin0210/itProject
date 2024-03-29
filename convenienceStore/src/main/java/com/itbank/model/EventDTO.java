package com.itbank.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

//IDX        NOT NULL NUMBER         
//COUPON_IDX NOT NULL NUMBER         
//WRITER     NOT NULL VARCHAR2(500)  
//TITLE      NOT NULL VARCHAR2(1000) 
//IMAGE               VARCHAR2(1000) 
//WRITEDATE           DATE           
//ENDDATE    NOT NULL DATE  

public class EventDTO {

	private int idx;
	private int coupon_idx;
	private String writer;
	private String title;
	private String image;
	private Date writeDate;
	private Date endDate;
	private List<MultipartFile> upload;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCoupon_idx() {
		return coupon_idx;
	}
	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	
	


}
