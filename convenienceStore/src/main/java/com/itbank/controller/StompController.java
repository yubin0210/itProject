package com.itbank.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.itbank.model.MessageDTO;

@Controller
public class StompController {
	

	@MessageMapping("/enter")
	@SendTo("/sendTo/admin")
	public MessageDTO enter(MessageDTO message, String userid) {
		if(message != null) {message.setContent(message.getWriter() + "님이 접속했습니다");}
		System.out.println(message.getWriter() + "님이 접속했습니다");
		return message;
	}
	
	@MessageMapping("/sendTo/admin/{userid}")
	@SendTo("/sendTo/admin")
	public MessageDTO chat(MessageDTO message) {
		return message;
	}
	
	@MessageMapping("/sendMsg/{userid}")
	@SendTo("/sendTo/{userid}")
	public MessageDTO message(MessageDTO message) {
		return message;
	}
	
	@MessageMapping("/disconnect/sendTo/{userid}")
	@SendTo("/sendTo/{userid}")
	public MessageDTO disconnect(MessageDTO message) {
		message.setContent(message.getWriter() + "님이 퇴장하셨습니다");
		message.setWriter("service");
		return message;
	}
}
