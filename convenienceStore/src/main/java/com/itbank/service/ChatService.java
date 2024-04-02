package com.itbank.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itbank.model.ChatDTO;
import com.itbank.model.MessageDTO;
import com.itbank.repository.ChatDAO;

@Service
public class ChatService {
	
	@Autowired private ChatDAO dao;

	public int insertChat(MessageDTO dto) {
		return dao.insertChat(dto);
	}

	public int creatRoom(String userid) {
		return dao.createRoom(userid);
	}

	public List<ChatDTO> getRoom(String userid) {
		return dao.selectRoom(userid);
	}

	public List<String> chatList() {
		return dao.chatList();
	}

	public int exitChat(String userid) {
		int row = dao.exit(userid);
		return row;
	}

	public List<MessageDTO> getMsg(int chat_idx) {
		return dao.getMsg(chat_idx);
	}


}
