package com.team2.app.chat;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/chat/*")
@Controller
public class ChatController {
	
//	@MessageMapping("send") // "/app/send" 경로로 들어오는 메시지 처리
//	@SendTo("/topic/messages") // "/topic/messages"로 메시지 브로드캐스트
//	public ChatVO sendMessage(ChatVO message) {
//		return message; // 수신한 메시지를 그대로 반환하여 브로드캐스트
//	}
	
    @GetMapping("room")
    public void chat() throws Exception {
    }
	
}
