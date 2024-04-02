package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.model.MylocationDTO;
import com.itbank.model.StoreDTO;
import com.itbank.model.StoreReviewDTO;
import com.itbank.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired StoreService service;
	
	@GetMapping("/list")
	public ModelAndView search(HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login == null) {
			ModelAndView mav = new ModelAndView("/alertNeedLogin");
			return mav;
		}
		MylocationDTO dto = service.selectLocation(login.getIdx());
		if(dto == null) {
			ModelAndView mav = new ModelAndView("/store/alertNeedSetmyLoc");
			return mav;
		}
		ModelAndView mav = new ModelAndView();
	    List<StoreDTO> list = service.selectList();
	    mav.addObject("storeList", list);
	    return mav;
	}
	
	
	@GetMapping("/view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/store/view");
		
		// 편의점 DTO불러오기
		StoreDTO dto = service.selectOne(idx);
		String userid = "";
		if(session.getAttribute("login") != null) {
			MemberDTO login = (MemberDTO)session.getAttribute("login");
			userid = login.getUserid();
		}
		
		// 좋아요 상태 불러오기
		boolean liked = service.isLike(idx,userid);
		
		// 로그인한 유저의 리뷰DTO 불러오기
		StoreReviewDTO myReview = service.selectMyReivew(idx, userid);
		
		// 편의점의 리뷰리스트 불러오기
		List<StoreReviewDTO> reviewList = service.selectReview(idx);
		
		mav.addObject("dto",dto);
		mav.addObject("liked",liked);
		mav.addObject("reviewList", reviewList);
		mav.addObject("myReview", myReview);
		return mav;
	}
	
}
