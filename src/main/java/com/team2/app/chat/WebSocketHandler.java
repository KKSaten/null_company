package com.team2.app.chat;

import java.awt.TextArea;
import java.io.IOException;
import java.net.URI;
import java.security.Principal;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team2.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class WebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private Message messageTo;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private ChatMapper chatMapper;

	private Map<String, Set<WebSocketSession>> sessionList = new ConcurrentHashMap<String, Set<WebSocketSession>>();
    private final Map<WebSocketSession, Integer> sessionUserMap = new HashMap<>();
    
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
		
		// sessionList 추가 전 방의 socket이 있으면 참여 메세지 전송
		if(!sessionList.isEmpty()) {
			if(!sessionList.get(roomNum).isEmpty()) {
				messageTo.saveText(employeeVO.getEmpName() + " 님이 채팅방에 들어왔습니다.");
				for (WebSocketSession socket: sessionList.get(roomNum)) {
					socket.sendMessage(new TextMessage(messageTo.getPayload()));
				}
			}
		}

		// 채팅룸 num ,websocket session 저장
		sessionList.putIfAbsent(roomNum, Collections.synchronizedSet(new HashSet<>()));
		sessionList.get(roomNum).add(session);
		
		// session, 사원 연결 저장
		sessionUserMap.putIfAbsent(session, employeeVO.getEmpNum());
		log.info("session 길이 : {}",sessionUserMap.size());
		
		
		
	}


	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("==================== message send");
		log.info("session Id : {}", session.getId());
		log.info("message : {}", message.toString());
		
		Authentication authentication = (Authentication) session.getPrincipal();
		EmployeeVO employeeVO = (EmployeeVO) authentication.getPrincipal();
		
		URI uri = session.getUri();
		String roomNum = uri.getQuery().substring(uri.getQuery().lastIndexOf('=') + 1);
		
		ChatVO chatVO = getChatVO(employeeVO, roomNum, message);
		
		//채팅 작성 후 채팅방에 websocket이 살아있는 사람 읽음 표시
		Set<WebSocketSession> set = sessionList.get(roomNum);
		log.info("set size : {}", set.size());
		if(set != null) {
			for(WebSocketSession socket:set) {
				Integer empNum = sessionUserMap.get(socket);
				log.info("socket socket: {}", socket);
				log.info("socket empNum: {}", empNum);
				
				if(empNum != employeeVO.getEmpNum()) {
					EmployeeVO vo = new EmployeeVO();
					vo.setEmpNum(empNum);
					
					ChatVO chatVO2 = getChatVO(vo, roomNum, null);
					chatVO2.setChatNum(chatVO.getChatNum());
					log.info("ch Read Status vo: {}" ,chatVO2);
					chatMapper.chReadStatus(chatVO2);
					log.info("ch Read Status");
				}
			}
		}
		
		int read = chatMapper.getReadCount(chatVO);
		chatVO.setReadCount(read);
		
		
		//Json으로 Message 전송
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(chatVO);
		
		for (WebSocketSession socket: sessionList.get(roomNum)) {
			socket.sendMessage(new TextMessage(json));
		}

	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("connect closed : {}", session.getPrincipal().getName());
		
		URI uri = session.getUri();
		String roomNum = uri.getQuery().substring(uri.getQuery().lastIndexOf('=') + 1);
		
		log.info("connect closed uri : {}", roomNum);
		
		Set<WebSocketSession> set = sessionList.get(roomNum);
		set.remove(session);
	}
	
	public ChatVO getChatVO (EmployeeVO employeeVO, String roomNum, TextMessage message) throws Exception {
		RoomMemberVO roomMemberVO = new RoomMemberVO();
		roomMemberVO.setEmpNum(employeeVO.getEmpNum());
		roomMemberVO.setRoomNum(Integer.parseInt(roomNum));
		
		roomMemberVO = chatService.getMemberDetail(roomMemberVO);
		
		ChatVO chatVO = new ChatVO();
		
		if(message != null) {
			chatVO.setMemberNum(roomMemberVO.getMemberNum());
			chatVO.setEmployeeVO(employeeVO);
			chatVO.setChatContents(message.getPayload());
			ChatVO vo = chatService.addChat(chatVO, roomMemberVO);
			chatVO.setChatNum(vo.getChatNum());
			chatVO.setCreateTime(vo.getCreateTime());
		}
		
		chatVO.setMemberNum(roomMemberVO.getMemberNum());
		
		log.info("getchatvo: {}", chatVO);
		
		return chatVO;
	}
	
}
