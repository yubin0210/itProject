package com.itbank.repository;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.itbank.model.CouponDTO;
import com.itbank.model.UserCouponDTO;

@Repository
public interface CouponRepository {

	int couponCount(String search);

	List<CouponDTO> getcouponList(HashMap<String, Object> map);

	int deleteCoupon(int idx);

	int insertCoupon(CouponDTO dto);

	List<CouponDTO> selectCoupons();

	int selectVaild(int coupon_idx);

	List<UserCouponDTO> getuserCouponList(String userid);

	int updateCoupon(int couponIdx);
}
