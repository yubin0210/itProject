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
import com.itbank.model.ProductAdminDTO;
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
		List<ProductAdminDTO> list = productService.searchList(param);
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
		ProductAdminDTO dto = productService.detail(idx);
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
	public ProductAdminDTO thisName(String name) {
		ProductAdminDTO dto = productService.thisName(name);
		return dto;	
	}
	
	@PostMapping("add")
	public ModelAndView addProduct(ProductAdminDTO dto, HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 1) {
			ModelAndView mav = new ModelAndView("/productAdmin/alertForbidden");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView("/productAdmin/alertFail");
			try {
				int row1 = productService.add(dto);
				
				String thisName = dto.getName();
				ProductAdminDTO thisIdx = productService.thisName(thisName);
				
				int row2 = productService.addInv(thisIdx.getIdx());
				
				mav.addObject("row1",row1);
				mav.addObject("row2",row2);
				mav.addObject("url", "/productAdmin/detailAdmin=" + thisIdx.getIdx());
			} catch (Exception e) {
				int row1 = 0;
				int row2 = 0;
				mav.addObject("row1",row1);
				mav.addObject("row2",row2);
			}

		
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
		ProductAdminDTO dto = productService.detail(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modify={idx}")
	public ModelAndView updateProduct(ProductAdminDTO dto, HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		MemberDTO login = (MemberDTO)httpsession.getAttribute("login");
		if(login == null || login.getRole() != 1) {
			ModelAndView mav = new ModelAndView("/productAdmin/alertForbidden");
			int row = 0;
			mav.addObject("row", row);
			return mav;
		}
		ModelAndView mav = new ModelAndView("/productAdmin/alertFail");
		try {
			int row1 = productService.update(dto);
			int row2 = 1;
			
			String thisName = dto.getName();
			ProductAdminDTO thisIdx = productService.thisName(thisName);
			
			mav.addObject("row1", row1);
			mav.addObject("row2", row2);
			mav.addObject("url", "/productAdmin/detailAdmin=" + thisIdx.getIdx());
		} catch (Exception e) {
			int row1 = 0;
			int row2 = 0;
			mav.addObject("row1", row1);
			mav.addObject("row2", row2);
		}	
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
		
		int row2 = productService.deleteInv(idx);
		int row1 = productService.delete(idx);
		
		mav.addObject("row1", row1);
		mav.addObject("row2", row2);

		mav.addObject("url", "/productAdmin/adminPage");
		return mav;
	}

}