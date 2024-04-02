package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MylocationDTO;
import com.itbank.model.StoreDTO;
import com.itbank.model.StoreReviewDTO;
import com.itbank.repository.StoreDAO;

@Service
public class StoreService {
	
	@Autowired StoreDAO dao;
	
	public List<StoreDTO> selectList() {
		return dao.selectListAll();
	}

	public List<StoreDTO> selectListByGu(String search) {
		search = "%" + search + "%";
		List<StoreDTO> list = dao.selectList(search);
		for(StoreDTO dto : list) {
			String[] arr = dto.getAddress().split(" ");
			dto.setGu(arr[1]);
			dto.setDong(arr[2]);
		}
		return list;
	}

	public List<StoreDTO> selectListByDong(String gu, String dong) {
		gu = "%" + gu + "%";
		dong = "%" + dong + "%";
		List<StoreDTO> list = dao.selectListByDong(gu, dong);
		for(StoreDTO dto : list) {
			String[] arr = dto.getAddress().split(" ");
			dto.setGu(arr[1]);
			dto.setDong(arr[2]);
		}
		return list;
	}

	public List<StoreDTO> selectListBySearch(String search) {
		search = "%" + search + "%";
		List<StoreDTO> list = dao.selectListBySearch(search);
		for(StoreDTO dto : list) {
			String[] arr = dto.getAddress().split(" ");
			dto.setGu(arr[1]);
			dto.setDong(arr[2]);
		}
		return list;
	}

	public StoreDTO selectOne(int idx) {
		StoreDTO dto = dao.selectOne(idx);
		
		List<StoreReviewDTO> list = dao.selectReview(idx);
		if(list.size() != 0) {
			int sum = 0;
			for(StoreReviewDTO reviewdto : list) {
				sum += reviewdto.getScore();
			}
			double avg = sum / (list.size() * 1.0);
			dto.setScoreAvg(avg);
		}
		
		return dto;
	}

	public boolean isLike(int idx, String userid) {
		int row = dao.selectLike(idx, userid);
		if(row == 1)	return true;
		else 			return false;
	}

	public int addLike(String userid, String store_idx) {
		return dao.insertLike(userid, store_idx);
	}

	public int deleteLike(String userid, String store_idx) {
		return dao.deleteLike(userid, store_idx);
	}

	public List<StoreReviewDTO> selectReview(int store_idx) {
		return dao.selectReview(store_idx);
	}

	public StoreReviewDTO selectMyReivew(int store_idx, String userid) {
		return dao.selectMyReview(store_idx, userid);
	}

	public int addReview(String userid, String store_idx, String score, String content) {
		return dao.insertReview(userid, store_idx, score, content);
	}

	public int deleteReview(String userid, String store_idx) {
		return dao.deleteReview(userid, store_idx);
	}

	public int updateReview(String userid, String store_idx, String score, String content) {
		return dao.updateReview(userid, store_idx, score, content);
	}

	public StoreDTO selectStoreLikeTop() {
		return dao.selectStoreLikeTop();
	}

	public MylocationDTO selectLocation(int idx) {
		return dao.selectMyLocation(idx);
	}

}
