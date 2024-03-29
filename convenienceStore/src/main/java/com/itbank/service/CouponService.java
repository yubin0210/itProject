package com.itbank.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itbank.model.CouponDTO;
import com.itbank.model.UserCouponDTO;
import com.itbank.repository.CouponRepository;

@Service
public class CouponService {

	@Autowired private CouponRepository cr;

	public int couponCount(String search) {
		return cr.couponCount(search);
	}

	public List<CouponDTO> getcouponList(HashMap<String, Object> map) {
		return cr.getcouponList(map);
	}

	public int deleteCoupon(int idx) {
		return cr.deleteCoupon(idx);
	}

	public int insertCoupon(CouponDTO dto) {
		return cr.insertCoupon(dto);
	}

	public List<CouponDTO> selectCoupons() {
		return cr.selectCoupons();
	}

	public int selectVaild(int coupon_idx) {
		return cr.selectVaild(coupon_idx);
	}

	public List<UserCouponDTO> getuserCouponList(String userid) {
		return cr.getuserCouponList(userid);
	}

	public int updateCoupon(int couponIdx) {
		return cr.updateCoupon(couponIdx);
	}

}
