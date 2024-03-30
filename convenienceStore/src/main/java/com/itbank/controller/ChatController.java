package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.ChatRoomDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.MessageDTO;
import com.itbank.service.ChatService;

@RestController
public class ChatController {
	
	@Autowired private ChatService service;

	@PostMapping("/sendMsg")
	public int insertChat(@RequestBody MessageDTO dto) {
		int row = service.insertChat(dto);
		return row;
	}
	@GetMapping("/create/{userid}")
	public int create (HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String userid = login.getUserid();
		return service.creatRoom(userid);
	}
	
	@GetMapping("/getRoom/{userid}")
	public List<ChatRoomDTO> getRoom(@PathVariable("userid") String userid) {
		return service.getRoom(userid);
	}
	
	@GetMapping("/chatList")
	public List<String> chatList() {
		return service.chatList();
	}
	
	@GetMapping("/exitChat/{userid}")
	public int exitChat(@PathVariable("userid") String userid) {
		return service.exitChat(userid);
	}
	
	@GetMapping("/getMsg/{chat_idx}")
	public List<MessageDTO> getMsg(@PathVariable("chat_idx") int chat_idx) {
		return service.getMsg(chat_idx);
	}
	
}
