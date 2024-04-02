package com.itbank.component;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
// 저장 - source - Override/Implements method

public class ChatComponent extends TextWebSocketHandler{

List<WebSocketSession> sessionList = new ArrayList<>();

@Override	//	연결이 성립된 이후 실행되는 함수
public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	System.out.println("연결 생성 : " + session);
	sessionList.add(session);
}


@Override	//	Text메시지를 전송받았을 때 실행되는 함수
protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	System.out.printf("[%s] : %s\n", session.getId(), message.getPayload());
	for(WebSocketSession ws : sessionList) {	// 세션리스트에 참여하는 모든 웹소켓에게
		ws.sendMessage(message);				//받은 메시지를 다시 보낸다
	}
}

@Override	//	연결이 끊어졌을 때 실행되는 함수
public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	System.out.println("연결 종료 : " + session);
	sessionList.remove(session);
	}

}
