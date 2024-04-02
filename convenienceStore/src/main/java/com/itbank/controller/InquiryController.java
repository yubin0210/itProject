package com.itbank.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.FaqDTO;
import com.itbank.service.InquiryService;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Autowired private InquiryService service;

	@GetMapping("/list")
	public ModelAndView inquiryList() {
		ModelAndView mav = new ModelAndView();
		List<FaqDTO> list = service.selectList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/write")
	public String write() {
		return "/inquiry/write";
	}
	
	@PostMapping("/write")
	public String write(FaqDTO dto) {
		int row = service.insert(dto);
		System.out.println(row != 0 ? "작성성공" : "작성실패");
		return "redirect:/inquiry/list";
	}
	
	@GetMapping("/delete")
	public String delete(int idx) {
		service.delete(idx);
		return "redirect:/inquiry/list";
	}
	
	@GetMapping("/userChat")
	public String chat() {
		return "/inquiry/userChat";
	}
	
	
}
