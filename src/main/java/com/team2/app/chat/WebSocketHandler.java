package com.team2.app.chat;

import java.awt.TextArea;
import java.io.IOException;
import java.net.URI;
import java.security.Principal;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.team2.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class WebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private Message messageTo;
	
	@Autowired
	private ChatService chatService;

	private Map<String, Set<WebSocketSession>> sessionList = new ConcurrentHashMap<String, Set<WebSocketSession>>();
    private final Map<WebSocketSession, String> sessionUserMap = new HashMap<>();
    
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("====================== chat connection");
		log.info("chat connection : {}", session.isOpen());

		// 연결된 직원 정보
		Authentication authentication = (Authentication) session.getPrincipal();
		EmployeeVO employeeVO = (EmployeeVO) authentication.getPrincipal();
		log.info("principal : {}", employeeVO);

		// 연결된 채팅방 번호
		URI uri = session.getUri();
		String roomNum = uri.getQuery().substring(uri.getQuery().lastIndexOf('=') + 1);
		log.info("connect roomNum : {}", roomNum);

		// 클라이언트 id ,websocket session 저장
		sessionList.putIfAbsent(roomNum, Collections.synchronizedSet(new HashSet<>()));
		sessionList.get(roomNum).add(session);
		
		if(!sessionList.get(roomNum).isEmpty()) {
			messageTo.saveText(employeeVO.getEmpName() + " 님이 채팅방에 들어왔습니다.");
			for (WebSocketSession socket: sessionList.get(roomNum)) {
				socket.sendMessage(new TextMessage(messageTo.getPayload()));
			}
		}
	}


	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("==================== message send");
		log.info("session Id : {}", session.getId());
		log.info("message : {}", message.toString());

		messageTo.saveText(session.getPrincipal().getName() + " : ");
		
		URI uri = session.getUri();
		String roomNum = uri.getQuery().substring(uri.getQuery().lastIndexOf('=') + 1);
		
		for (WebSocketSession socket: sessionList.get(roomNum)) {
			socket.sendMessage(new TextMessage(messageTo.getPayload() + message.getPayload()));
		}
		
		Authentication authentication = (Authentication) session.getPrincipal();
		EmployeeVO employeeVO = (EmployeeVO) authentication.getPrincipal();
		
		ChatVO chatVO = new ChatVO();
		chatVO.setEmpNum(employeeVO.getEmpNum());
		chatVO.setRoomNum(Integer.parseInt(roomNum));
		chatVO.setChatContents(message.getPayload());
		
		chatService.addChat(chatVO);

	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("connect closed : {}", session.getPrincipal().getName());
	}

}
