package com.itbank.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.model.MylocationDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.ProductReviewDTO;
import com.itbank.model.StoreDTO;
import com.itbank.service.ProductService;
import com.itbank.service.StoreService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired ProductService service;
	@Autowired StoreService storeService;
	
	@GetMapping("/storeList/{idx}")
	public ModelAndView productListByStore(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/product/storeList");
		List<ProductDTO> list = service.productListByStore(idx);
		StoreDTO storeDTO = storeService.selectOne(idx);
		
		mav.addObject("list",list);
		mav.addObject("storeDTO",storeDTO);
		return mav;
	}
	
	@GetMapping("/list")
	public ModelAndView productList() {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> list = service.productList();
		mav.addObject("list",list);
		return mav;
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView selectProductOne(@PathVariable("idx") String idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/product/view");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		List<StoreDTO> storeList = new ArrayList<>();
		
		if(login != null) {
			String userid = login.getUserid();
			int member_idx = login.getIdx();
			boolean liked = service.isLike(idx,userid);
			storeList = service.selectStoreListByInventoryAndMyLoc(member_idx ,idx);
			ProductReviewDTO myReview = service.selectMyReview(idx, userid);
			MylocationDTO mylocDTO = service.selectMyLocation(member_idx);
			
			mav.addObject("liked", liked);
			mav.addObject("myReview", myReview);
			mav.addObject("mylocDTO", mylocDTO);
		}else {
			storeList = service.selectStoreListByInventory(idx);
		}
		
		ProductDTO productDTO = service.selectProductOne(idx);
		List<ProductReviewDTO> reviewList = service.selectProductReviewList(idx);
		
		mav.addObject("productDTO", productDTO);
		mav.addObject("storeList", storeList);
		mav.addObject("reviewList", reviewList);
		
		return mav;
	}

}
