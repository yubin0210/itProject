package com.itbank.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.model.mylocationDTO;
import com.itbank.service.HomeService;

@Controller
public class HomeController {
	
	@Autowired private HomeService homeService;

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
		mylocationDTO dto = homeService.selectLocation(login.getIdx());
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/myLocation")
	public ModelAndView setMyLocation(@RequestParam("action") String action, mylocationDTO dto) {
		ModelAndView mav = new ModelAndView("alertLocation");
		if("action1".equals(action)) {
			int row = homeService.setLocation(dto);
			mav.addObject("dto", row);
		}
		
		if("action2".equals(action)) {
			int row = homeService.updateLocation(dto);
			mav.addObject("dto", row);
		}
		
		return mav;
	}
	
}
