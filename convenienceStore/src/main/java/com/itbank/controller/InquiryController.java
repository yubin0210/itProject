package com.itbank.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	
}
