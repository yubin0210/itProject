package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.MemberDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.ProductReviewDTO;
import com.itbank.model.StoreDTO;
import com.itbank.service.ProductService;

@RestController
@RequestMapping("/product")
public class ProductAjaxController {
	
	@Autowired ProductService service;
	
	// 편의점 별 상품 목록
	@PostMapping("/searchListByStore")
	public List<ProductDTO> selectList(@RequestBody HashMap<String, String> param) {
		String search = param.get("search");
		String store_idx = param.get("store_idx");
		return service.productSearchListByStore(store_idx, search);
	}
	
	// 편의점 별 상품의 재고수량 포함한 상품상세
	@PostMapping("/selectOne")
	public ProductDTO selectOneByStore(@RequestBody HashMap<String, String> param) {
		String store_idx = param.get("store_idx");
		String product_idx = param.get("product_idx");
		
		return service.SelectOneByStore(store_idx, product_idx);
	}
	
	// 장바구니에 상품 추가
	@PostMapping("/addCart")
	public int addCart(@RequestBody HashMap<String, String> param, HttpSession session) {
		String store_idx = param.get("store_idx");
		String product_idx = param.get("product_idx");
		String cnt = param.get("cnt");
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String userid = login.getUserid();
		
		int count = 0;
		if(session.getAttribute("count") != null) {
			count = (int)session.getAttribute("count");
		}
		session.setAttribute("count", count + 1);
		
		return service.addCart(userid, store_idx, product_idx, cnt);
	}
	
	// 장바구니에 들어가있는 상품의 종류 수
	@PostMapping("/selectCount")
	public int selectCartCount(HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String userid = login.getUserid();
		return service.selectCartListCount(userid);
	}
	
	// 해당 유저의 장바구니 상품 모두 삭제
	@DeleteMapping("/deleteAllCart")
	public int deleteAllCart(HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String userid = login.getUserid();
		session.removeAttribute("count");
		return service.deleteAllCart(userid);
	}
	
	// 장바구니에 등록된 편의점 찾기
	@GetMapping("/selectCartStore")
	public int selectCartStore(HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String userid = login.getUserid();
		return service.selectCartStore(userid);
	}
	
	@PostMapping("/SearchList")
	public List<ProductDTO> selectProductList(@RequestBody HashMap<String, String> param) {
		String search = param.get("search");
		return service.productSearchList(search);
	}
	
	@PostMapping("/view/like")
	public int addProductLike(@RequestBody HashMap<String, String> param) {
		String userid = param.get("userid");
		String product_idx = param.get("product_idx");
		return service.addProductLike(userid, product_idx);
	}
	
	@DeleteMapping("/view/like")
	public int deleteProductLike(@RequestBody HashMap<String, String> param) {
		String userid = param.get("userid");
		String product_idx = param.get("product_idx");
		return service.deleteProductLike(userid, product_idx);
	}
	
	@PostMapping("/view/review")
	public int addProductReview(@RequestBody HashMap<String, String> param) {
		String product_idx = param.get("product_idx");
		String score = param.get("insertScore");
		String content = param.get("content");
		String userid = param.get("userid");
		
		return service.addProductReview(userid, score, content, product_idx);
	}
	
	@DeleteMapping("/view/review")
	public int deleteProductReview(@RequestBody HashMap<String, String> param) {
		String product_idx = param.get("product_idx");
		String userid = param.get("userid");
		
		return service.deleteProductReview(userid, product_idx);
	}
	
	@GetMapping("/storeList/myLoc/{idx}")
	public List<StoreDTO> selectStoreListByMyLocation(@PathVariable("idx") String idx, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login != null) {
			int member_idx = login.getIdx();
			return service.selectStoreListByInventoryAndMyLoc(member_idx, idx);
		}else {
			return service.selectStoreListByInventory(idx);
		}
		
	}
	
	@GetMapping("/view/review/{idx}")
	public List<ProductReviewDTO> selectProdutReview(@PathVariable("idx") String idx) {
		return service.selectProductReviewList(idx);
	}
	
}
