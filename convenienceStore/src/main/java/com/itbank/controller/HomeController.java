package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.StoreDTO;
import com.itbank.service.ProductService;
import com.itbank.service.StoreService;

@Controller
public class HomeController {
	
	@Autowired ProductService productService;
	@Autowired StoreService storeService;
	
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
	
}
