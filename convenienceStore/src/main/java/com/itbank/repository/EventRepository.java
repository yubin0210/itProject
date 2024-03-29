package com.itbank.repository;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.itbank.model.EventDTO;
import com.itbank.model.UserCouponDTO;

@Repository
public interface EventRepository {

	List<EventDTO> getEndEventList(HashMap<String, Object> map);

	List<EventDTO> getCurrentEventList(HashMap<String, Object> map);
	
	int selectCurrentCount(String search);

	int selectEndCount(String search);

	int deleteEvent(int idx);
	
	EventDTO selectOne(int idx);
	
	int writeEvent(EventDTO dto);

	int getUserCoupon(UserCouponDTO dto);

	UserCouponDTO check(UserCouponDTO dto);

	int modify(EventDTO dto);

}
