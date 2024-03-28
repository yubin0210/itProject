package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.model.ProductDTO;
import com.itbank.service.ProductShopService;
import com.itbank.utils.Paging;

@Controller
@RequestMapping("/productShop")
public class ProductShopController {
	
	@Autowired ProductShopService productShopService;
	
	@GetMapping("/productList")
	public ModelAndView adminPage(@RequestParam(required = false) String p, @RequestParam(required=false) String name, @RequestParam(required=false) String category_idx, HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 2) {
			ModelAndView mav = new ModelAndView("/productAdmin/alertForbidden");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView();
		if(p == null) {p = "1";}
		if(name == null) {name = "";}
		if(category_idx == null) {category_idx = "";}
		int page = Integer.parseInt(p);
		HashMap<String,Object> param = new HashMap<>();
		param.put("name", name);
		param.put("category_idx", category_idx);
		int boardCount = productShopService.selectCount(param);
		Paging paging = new Paging(page, boardCount);
		param.put("paging", paging);
		List<ProductDTO> list = productShopService.searchList(param);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/detailShop={idx}")
	public ModelAndView detailAdmin(@PathVariable("idx") int idx, HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 2) {
			ModelAndView mav = new ModelAndView("/productAdmin/alertForbidden");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView("/productShop/detailShop");
		ProductDTO dto = productShopService.detail(idx);
		mav.addObject("dto", dto);
		return mav;
	}

}
