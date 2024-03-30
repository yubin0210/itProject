package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService ms;

	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(HttpSession session, MemberDTO dto) {
		MemberDTO login = ms.login(dto);
		session.setAttribute("login", login);
		// alert 띄우거나 마음대루
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public void join() {}

	@PostMapping("/join")
	public String join(MemberDTO dto) {
		ms.join(dto);
		// alert 띄우거나 마음대루
		return "redirect:/member/login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
