package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.model.MylocationDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.StoreDTO;
import com.itbank.service.HomeService;
import com.itbank.service.ProductService;
import com.itbank.service.StoreService;

@Controller
public class HomeController {
	
	@Autowired ProductService productService;
	@Autowired StoreService storeService;
	@Autowired private HomeService homeService;
	
	@GetMapping("/")
	public ModelAndView home(HttpSession session) {
		ModelAndView mav = new ModelAndView("home");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login != null) {
			String userid = login.getUserid();
			int count = productService.selectCartListCount(userid);
			session.setAttribute("count", count);
		}
		
		List<ProductDTO> list = productService.selectProductLikeTop();
		StoreDTO storeDTO = storeService.selectStoreLikeTop();
		mav.addObject("list", list);
		mav.addObject("storeDTO", storeDTO);
		return mav;
	}
	
	@GetMapping("/myLocation")
	public ModelAndView myLocation(HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null) {
			ModelAndView mav = new ModelAndView("/alertNeedLogin");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView();
		MylocationDTO dto = homeService.selectLocation(login.getIdx());
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/myLocation")
	public ModelAndView setMyLocation(@RequestParam("action") String action, MylocationDTO dto) {
		ModelAndView mav = new ModelAndView("alertLocation");
		try {
			if("action1".equals(action)) {
				int row = homeService.setLocation(dto);
				mav.addObject("dto", row);
			}
			
			if("action2".equals(action)) {
				int row = homeService.updateLocation(dto);
				mav.addObject("dto", row);
			}
		} catch(Exception e) {
			int row = 0;
			mav.addObject("dto", row);
		}
		
		return mav;
	}
	
}
