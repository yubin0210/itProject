package com.itbank.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itbank.component.MailComponent;
import com.itbank.model.CartDTO;
import com.itbank.model.MemberDTO;
import com.itbank.repository.PaymentRepository;

@Service
public class PaymentService {

	@Autowired private PaymentRepository pr;
	@Autowired private MailComponent mc;

	public List<CartDTO> cartList(String userid) {
		return pr.cartList(userid);
	}

	public String getStoreName(int store_idx) {
		return pr.getStoreName(store_idx);
	}

	public int deleteCart(int idx) {
		return pr.deleteCart(idx);
	}
	
	public void removeCart(int[] idx) {
		for(int i = 0; i < idx.length; i++) {
			pr.removeCart(idx[i]);
		}
	}

	public List<CartDTO> selectCartList(int[] idx) {
		List<CartDTO> cart = new ArrayList<>();
		for(int i = 0; i < idx.length; i++) {
			CartDTO dto = pr.selectCart(idx[i]);
			cart.add(dto);
		}
		return cart;
	}

	public void setOrderInfo(String userid,
							String paymentKey, 
							String orderId, 
							int amount,
							int[] idx, 
							int[] storageCnt, 
							MemberDTO member, 
							String orderName, 
							String method) {
		// 상품의 price가 포함된 cartList
		List<CartDTO> cart = selectCartList(idx);

		// orders에 넣기위한 store_idx와 pickupCode 생성
		int store_idx = cart.get(0).getStore_idx();
		String pickupCode = UUID.randomUUID().toString().substring(0, 8);
		String orderdetail_idx = "";

		HashMap<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("paymentKey", paymentKey);
		map.put("orderId", orderId);
		map.put("amount", amount);
		map.put("store_idx", store_idx);
		map.put("pickupCode", pickupCode);
		
		// 결제 완료된 정보를 orders와 orderdetail와 storageitem에 insert
		pr.insertOrders(map);
		
		for(int i = 0; i < cart.size(); i++) {
			int product_idx = cart.get(i).getProduct_idx();
			int cnt = cart.get(i).getCnt() + cart.get(i).getEventCnt();
			int price = cart.get(i).getPrice() * cart.get(i).getCnt();
			int rescount = storageCnt[i];
			orderdetail_idx = UUID.randomUUID().toString().substring(0, 8);
			
			map.put("product_idx", product_idx);
			map.put("cnt", cnt);
			map.put("price", price);
			map.put("orderdetail_idx", orderdetail_idx);
			
			pr.insertOrderdetail(map);
			
			pr.updateInventory(map);
			
			if(rescount > 0) {
				map.put("rescount", rescount);
				pr.insertStorage(map);
			}
		}
		
        // 결제정보 이메일 보내기
        HashMap<String, Object> param = new HashMap<String, Object>();
        String email = member.getEmail();
        String storeName = pr.selectStoreName(store_idx);
        
        // 현재 날짜
        Date now = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String sysdate = formatter.format(now);
        
        param.put("address", email);
        param.put("subject", "[GS25] 결제 내역 안내");
        param.put("orderName", orderName);
        param.put("sysdate", sysdate);
        param.put("amount", amount);
        param.put("method", method);
        param.put("storeName", storeName);
        
        int row = mc.sendPayMentMessage(param);
	}
	
}
