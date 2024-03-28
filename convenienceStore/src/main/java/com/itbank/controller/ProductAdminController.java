package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.model.ProductDTO;
import com.itbank.service.ProductAdminService;
import com.itbank.utils.Paging;

@Controller
@RequestMapping("/productAdmin")
public class ProductAdminController {
	
	@Autowired private ProductAdminService productService;
	
	@GetMapping("/adminPage")
	public ModelAndView adminPage(@RequestParam(required = false) String p, @RequestParam(required=false) String name, @RequestParam(required=false) String category_idx, HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 1) {
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
		int boardCount = productService.selectCount(param);
		Paging paging = new Paging(page, boardCount);
		param.put("paging", paging);
		List<ProductDTO> list = productService.searchList(param);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/detailAdmin={idx}")
	public ModelAndView detailAdmin(@PathVariable("idx") int idx, HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 1) {
			ModelAndView mav = new ModelAndView("/productAdmin/alertForbidden");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView("/productAdmin/detailAdmin");
		ProductDTO dto = productService.detail(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/add")
	public ModelAndView add(HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 1) {
			ModelAndView mav = new ModelAndView("/productAdmin/alertForbidden");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	// add 사이트 이동을 돕는 함수 (이름으로 select)
	public ProductDTO thisName(String name) {
		ProductDTO dto = productService.thisName(name);
		return dto;	
	}
	
	@PostMapping("add")
	public ModelAndView addProduct(ProductDTO dto, HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 1) {
			ModelAndView mav = new ModelAndView("/productAdmin/alertForbidden");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView("/productAdmin/alertFail");

		int row = productService.add(dto);
		
		String thisName = dto.getName();
		ProductDTO thisIdx = productService.thisName(thisName);
		
		mav.addObject("row",row);
		mav.addObject("url", "/productAdmin/detailAdmin=" + thisIdx.getIdx());
		return mav;
	}
	
	@GetMapping("/modify={idx}")
	public ModelAndView updateProduct(@PathVariable("idx") int idx, HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 1) {
			ModelAndView mav = new ModelAndView("/productAdmin/alertForbidden");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView("/productAdmin/modify");
		ProductDTO dto = productService.detail(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modify={idx}")
	public ModelAndView updateProduct(ProductDTO dto, HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 1) {
			ModelAndView mav = new ModelAndView("/productAdmin/alertForbidden");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView("/productAdmin/alertFail");
		
		int row = productService.update(dto);
		
		String thisName = dto.getName();
		ProductDTO thisIdx = productService.thisName(thisName);
		
		mav.addObject("row", row);
		mav.addObject("url", "/productAdmin/detailAdmin=" + thisIdx.getIdx());
		return mav;
	}


	@GetMapping("/delete={idx}")
	public ModelAndView deleteProduct(@PathVariable("idx") int idx, HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 1) {
			ModelAndView mav = new ModelAndView("/productAdmin/alertForbidden");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView("/productAdmin/alertFail");
		
		int row = productService.delete(idx);
		
		mav.addObject("row", row);
		mav.addObject("url", "/productAdmin/productList");
		return mav;
	}

}