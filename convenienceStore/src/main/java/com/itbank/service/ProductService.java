package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.CartDTO;
import com.itbank.model.MylocationDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.StoreDTO;
import com.itbank.model.ProductReviewDTO;
import com.itbank.repository.ProductDAO;

@Service
public class ProductService {
	
	@Autowired ProductDAO dao;
	
	// 편의점 별 상품 목록
	public List<ProductDTO> productListByStore(int idx) {
		return dao.selectProductListByStore(idx);
	}
	
	// 편의점 내 상품 검색
	public List<ProductDTO> productSearchListByStore(String store_idx, String search) {
		search = "%" + search + "%";
		return dao.selectProductSearchListByStore(store_idx, search);
	}
	
	// 편의점 내 해당 상품의 재고수량을 포함한 상품상세
	public ProductDTO SelectOneByStore(String store_idx, String product_idx) {
		ProductDTO dto = dao.selectOne(product_idx);
		int count = dao.InventoryCount(store_idx, product_idx);
		dto.setInventoryCnt(count);
		return dto;
	}
	
	// 장바구니 상품 종류 수
	public int selectCartListCount(String userid) {
		int count = dao.selectCartListCount(userid);
		return count;
	}
	
	// 장바구니 상품 추가
	public int addCart(String userid, String store_idx, String product_idx, String cnt) {
		String event = dao.selectProductEvent(product_idx);
		int count = Integer.parseInt(cnt);
		int eventCount = 0;
		
		List<CartDTO> list = dao.selectCart(userid);
		boolean isCart = false;
	
		for(CartDTO dto : list) {
			// 해당 상품이 장바구니에 담겨있는지 확인
			if(dto.getProduct_idx() == Integer.parseInt(product_idx)) {
				isCart = true;	
				count += dto.getCnt() + dto.getEventCnt();
			}
		}
		
		// 이벤트별 count/eventCount 수량 변경
		if("1+1".equals(event)) {		// 1+1행사일 때 count와 eventCount 수량
			eventCount = count/2;
			count = count/2 + count%2;
		}else if("2+1".equals(event)) {	// 2+1행사일 때 count와 eventCount 수량
			eventCount = count/3;
			count = (count/3)*2 + (count%3);
		}
		
		if(isCart) {	// 이미 장바구니에 있으면 수량 변경
			return dao.updateCart(userid, store_idx, product_idx, count, eventCount);
		}else {			// 장바구니에 없으면 새로 추가
			return dao.insertCart(userid, store_idx, product_idx, count, eventCount);
		}
	}
	
	// 해당 유저의 장바구니 상품 모두 삭제
	public int deleteAllCart(String userid) { 
		return dao.deleteAllCart(userid);
	}
	
	// 장바구니 등록 편의점 idx
	public Integer selectCartStore(String userid) {
		Integer row = dao.selectCartStore(userid);
		if(row == null) return 0;
		else return row;
	}

	public List<ProductDTO> productList() {
		return dao.selectProductList();
	}

	public List<ProductDTO> productSearchList(String search) {
		search = "%" + search + "%";
		return dao.selectProductListBySearch(search);
	}
	
	public ProductDTO selectProductOne(String idx) {
		ProductDTO dto = dao.selectOne(idx);
		
		List<ProductReviewDTO> list = dao.selectReview(idx);
		if(list.size() != 0) {
			int sum = 0;
			for(ProductReviewDTO reviewdto : list) {
				sum += reviewdto.getScore();
			}
			double avg = sum / (list.size() * 1.0);
			dto.setScoreAvg(avg);
		}
		int count = dao.selectProductLikeCount(idx);
		dto.setLikeCount(count);
		
		return dto;
	}

	public boolean isLike(String idx, String userid) {
		int row = dao.selectLike(idx, userid);
		if(row == 1)	return true;
		else 			return false;
	}

	public List<StoreDTO> selectStoreListByInventoryAndMyLoc(int member_idx,String idx) {
		return dao.selectStoreListByInventoryAndMyLoc(member_idx, idx);
	}
	
	public List<StoreDTO> selectStoreListByInventory(String idx) {
		return dao.selectStoreListByInventory(idx);
	}

	public List<ProductReviewDTO> selectProductReviewList(String idx) {
		return dao.selectReview(idx);
	}

	public int addProductLike(String userid, String product_idx) {
		return dao.insertProductLike(userid, product_idx);
	}

	public int deleteProductLike(String userid, String product_idx) {
		return dao.deleteProductLike(userid, product_idx);
	}

	public int addProductReview(String userid, String score, String content, String product_idx) {
		return dao.insertProductReview(userid, score, content, product_idx);
	}
	
	public ProductReviewDTO selectMyReview(String idx, String userid) {
		return dao.selectMyReview(idx, userid);
	}
	
	public int deleteProductReview(String userid, String product_idx) {
		return dao.deleteProductReview(userid, product_idx);
	}

	public MylocationDTO selectMyLocation(int member_idx) {
		return dao.selectMyLocation(member_idx);
	}

	public List<ProductDTO> selectProductLikeTop() {
		return dao.selectProductLikeTop();
	}
	

}
