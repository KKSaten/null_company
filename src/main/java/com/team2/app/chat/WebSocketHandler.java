package com.team2.app.chat;

import java.awt.TextArea;
import java.io.IOException;
import java.net.URI;
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
	private Message messageTo;

	private Map<String, WebSocketSession> sessionList = new ConcurrentHashMap<String, WebSocketSession>();

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
		String roomNum = uri.getQuery().substring(uri.getQuery().lastIndexOf('=')+1);
		log.info("connect roomNum : {}", roomNum);
		
		
		String sessionId = employeeVO.getEmpId();
		messageTo.saveText(sessionId + " 님이 채팅방에 들어왔습니다.");

		// 클라이언트 id ,websocket session 저장
		sessionList.put(sessionId, session);
		if (sessionList.size() != 0) {
			sessionList.forEach((id, socket) -> {
				if (!id.equals(sessionId)) {
					try {
						socket.sendMessage(new TextMessage(messageTo.getPayload()));
					} catch (IOException e) {
						e.printStackTrace();
					}
					log.info("text 전송");
				}
			});
		}

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		log.info("message : {}", message.toString());

		messageTo.saveText(session.getPrincipal().getName() + " : ");

		sessionList.forEach((key, value) -> {
			try {
				value.sendMessage(new TextMessage(messageTo.getPayload() + message.getPayload()));
			} catch (IOException e) {
				e.printStackTrace();
			}
		});

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
