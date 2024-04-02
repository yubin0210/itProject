package com.itbank.model;

import org.springframework.web.multipart.MultipartFile;

// IDX          NOT NULL NUMBER         
// CATEGORY_IDX NOT NULL NUMBER         
// NAME         NOT NULL VARCHAR2(500)  
// PRICE        NOT NULL NUMBER         
// CONTENT               VARCHAR2(4000) 
// IMAGE        NOT NULL VARCHAR2(1000) 
// EVENT                 VARCHAR2(100)  

public class ProductDTO {

	private int idx;
	private int category_idx;
	private String name;
	private int price;
	private String content;
	private String image;
	private String event;
	
	private String eventTemp;
	
	private MultipartFile upload;
	private int InventoryCnt;
	
	private double scoreAvg;
	private int likeCount;
	

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public double getScoreAvg() {
		return scoreAvg;
	}

	public void setScoreAvg(double scoreAvg) {
		this.scoreAvg = scoreAvg;
	}

	public int getInventoryCnt() {
		return InventoryCnt;
	}

	public void setInventoryCnt(int inventoryCnt) {
		InventoryCnt = inventoryCnt;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getEventTemp() {
		return eventTemp;
	}
	public void setEventTemp(String eventTemp) {
		this.eventTemp = eventTemp;
	}
	
}
