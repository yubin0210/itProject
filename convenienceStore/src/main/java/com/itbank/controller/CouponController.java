package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
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
import com.itbank.service.CouponService;

@Controller
@RequestMapping("/event")
public class CouponController {
	
	@Autowired private CouponService cs;
	
	@GetMapping("/couponList/{page}")
	public ModelAndView couponList(@PathVariable("page") int page, @RequestParam(required=false) String search){
		ModelAndView mav = new ModelAndView("/event/couponList");
		
		if(search==null) {search="";}
		int count = cs.couponCount(search);
		Paging paging = new Paging(page, count);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("search", search);
		
		List<CouponDTO> list = cs.getcouponList(map);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("search", search);
		return mav;
	}

	@GetMapping("/couponDelete/{idx}")
	public String deleteCoupon(@PathVariable("idx") int idx) {
		int row = cs.deleteCoupon(idx);
		System.out.println(row != 1 ? "삭제 실패" : "삭제 성공");
		return "redirect:/event/couponList/1";
	}
	
	@GetMapping("/couponWrite")
	public void couponWrite() {}
	
	@PostMapping("/couponWrite")
	public String couponWrite(CouponDTO dto) {
		int row = cs.insertCoupon(dto);
		System.out.println(row != 1 ? "작성 실패" : "작성 성공");
		return "redirect:/event/couponList/1";
	}
}
