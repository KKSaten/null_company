package com.team2.app.chat;

import java.awt.TextArea;
import java.io.IOException;
import java.security.Principal;
import java.util.Map;
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
	private Message message;
	
	private Map<String, WebSocketSession> sessionList = new ConcurrentHashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("====================== chat connection");
		log.info("chat connection : {}", session.isOpen());
		
		Authentication authentication = (Authentication) session.getPrincipal();
		EmployeeVO employeeVO = (EmployeeVO) authentication.getPrincipal();
		log.info("principal : {}", employeeVO);
		
		String sessionId = employeeVO.getEmpId();
		
		message.saveText(sessionId+" 님이 채팅방에 들어왔습니다.");
		
		// 클라이언트 id ,websocket session 저장
		sessionList.put(sessionId, session);
		sessionList.forEach((id, socket)->{
			if(!id.equals(sessionId)) {
				try {
					socket.sendMessage(new TextMessage(message.getPayload()));
					log.info("text 전송");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		});
		
		
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		log.info("message : {}", message.toString());
//		for(WebSocketSession s : sessionList) {
//			s.sendMessage(new TextMessage(":" + message.getPayload()));
//		}
		
		
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}

	
	
}
