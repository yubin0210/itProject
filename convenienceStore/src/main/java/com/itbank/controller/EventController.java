package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.itbank.component.Paging;
import com.itbank.model.CouponDTO;
import com.itbank.model.EventDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.UserCouponDTO;
import com.itbank.service.CouponService;
import com.itbank.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired private EventService es;
	@Autowired private CouponService cs;
	
	@GetMapping("/list/{page}")
	public ModelAndView getEventList(@PathVariable("page") int page, @RequestParam(required=false) String search) {
		ModelAndView mav = new ModelAndView("/event/list");

		if(search==null) {search="";}
		int count = es.selectCurrentCount(search);
		Paging paging = new Paging(page, count);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("search", search);
		
		List<EventDTO> list = es.getCurrentEventList(map);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("search", search);
		mav.addObject("status", "current");
		return mav;
	}
	
	@GetMapping("/endList/{page}")
	public ModelAndView getEndEventList(@PathVariable("page") int page, @RequestParam(required=false) String search) {
		ModelAndView mav = new ModelAndView("/event/list");

		if(search==null) {search="";}
		int count = es.selectEndCount(search);
		Paging paging = new Paging(page, count);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("search", search);
		
		List<EventDTO> list = es.getEndEventList(map);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("search", search);
		mav.addObject("status", "end");
		return mav;
	}
	
	@GetMapping("/delete/{idx}")
	public String deleteEvent(@PathVariable("idx") int idx) {
		int row = es.deleteEvent(idx);
		System.out.println(row != 1 ? "삭제 실패" : "삭제 성공");
		return "redirect:/event/list/1";
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView eventView(@PathVariable("idx") int idx, String status, HttpSession session) {
		ModelAndView mav = new ModelAndView("/event/view");
		EventDTO dto = es.selectOne(idx);
		mav.addObject("dto", dto);
		mav.addObject("status", status);
		
		if(session.getAttribute("login") != null) {
			MemberDTO login = (MemberDTO) session.getAttribute("login");
			String userid = login.getUserid();
			UserCouponDTO userDto = new UserCouponDTO();
			
			userDto.setCoupon_idx(dto.getCoupon_idx());
			userDto.setUserid(userid);
			UserCouponDTO check = es.check(userDto);
			if(check != null) {
				mav.addObject("able", "not");
			}
			else {
				mav.addObject("able", "ok");
			}
		}
		
		return mav;
	}
	
	@GetMapping("/userCoupon/{coupon_idx}")
	public String userCoupon(@PathVariable("coupon_idx") int coupon_idx, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String userid = login.getUserid();
		
		UserCouponDTO dto = new UserCouponDTO();
		dto.setCoupon_idx(coupon_idx);
		dto.setUserid(userid);
		
		int valid = cs.selectVaild(coupon_idx);
		dto.setValid(valid);
		
		int row = es.getUserCoupon(dto);
		System.out.println(row != 1 ? "쿠폰받기 실패" : "쿠폰받기 성공");
		
		return "redirect:/event/list/1";
	}
	
	@GetMapping("/write")
	public ModelAndView writeEventBoard() {
		ModelAndView mav = new ModelAndView();
		List<CouponDTO> list = cs.selectCoupons();
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/write")
	public String writeEventBoard(EventDTO dto) {
		int row = es.writeEvent(dto);
		System.out.println(row != 1 ? "작성 실패" : "작성 성공");
		return "redirect:/event/list/1";
	}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/event/modify");
		List<CouponDTO> list = cs.selectCoupons();
		mav.addObject("list", list);
		
		EventDTO dto = es.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modify/{idx}")
	public String modify(EventDTO dto) {
		int row = es.modify(dto);
		System.out.println(row != 1 ? "수정 성공" : "수정 실패");
		return "redirect:/event/list/1";
	}
	
}
