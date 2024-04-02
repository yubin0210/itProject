package com.itbank.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.itbank.model.MessageDTO;

@Controller
public class StompController {
	
	@MessageMapping("/sendTo/{userid}")
	@SendTo("/sendTo/{userid}")
	public MessageDTO message(MessageDTO message) {
		return message;
	}
	
	@MessageMapping("/disconnect")
	@SendTo("/sendTo/admin")
	public MessageDTO disconnect(MessageDTO message) {
		message.setContent(message.getWriter() + " 님의 상담이 종료되었습니다.");
		message.setWriter("service");
		return message;
	}
}
