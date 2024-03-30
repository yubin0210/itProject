package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.StoreDTO;
import com.itbank.service.StoreService;

@RestController
@RequestMapping("/store")
public class StoreAjaxController {
	
	@Autowired StoreService service;
	
	// store/list 처리
	@PostMapping("/listBySearch")
	public List<StoreDTO> selectList(@RequestBody HashMap<String, String> param) {
		String search = param.get("search");
		return service.selectListBySearch(search);
	}
	
	@PostMapping("/listByGu")
	public List<StoreDTO> selectListByGu(@RequestBody HashMap<String, String> param) {
		String gu = param.get("gu");
		return service.selectListByGu(gu);
	}
	
	@PostMapping("/listByDong")
	public List<StoreDTO> selectListByDong(@RequestBody HashMap<String, String> param) {
		String gu = param.get("gu");
		String dong = param.get("dong");
		return service.selectListByDong(gu, dong);
	}
	
	
	// store/view 처리
	@PostMapping("/view/like")
	public int addLike(@RequestBody HashMap<String, String> param) {
		String userid = param.get("userid");
		String store_idx = param.get("store_idx");
		
		return service.addLike(userid, store_idx);
	}
	
	@PostMapping("/view/review")
	public int addReview(@RequestBody HashMap<String, String> param) {
		String userid = param.get("userid");
		String store_idx = param.get("store_idx");
		String score = param.get("insertScore");
		String content = param.get("content");
		
		return service.addReview(userid, store_idx, score, content);
	}
	
	@DeleteMapping("/view/like")
	public int deleteLike(@RequestBody HashMap<String, String> param) {
		String userid = param.get("userid");
		String store_idx = param.get("store_idx");
		
		return service.deleteLike(userid, store_idx);
	}
	
	@DeleteMapping("/view/review")
	public int deleteReview(@RequestBody HashMap<String, String> param) {
		String userid = param.get("userid");
		String store_idx = param.get("store_idx");
		
		return service.deleteReview(userid, store_idx);
	}
	
	@PutMapping("/view/review")
	public int updateReview(@RequestBody HashMap<String, String> param) {
		String userid = param.get("userid");
		String store_idx = param.get("store_idx");
		String score = param.get("insertScore");
		String content = param.get("content");
		
		return service.updateReview(userid, store_idx, score, content);
	}
	
	
}
