package com.team2.app.chat;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketMessage;

@Component
public class Message implements WebSocketMessage<String> {
	
	private String payloadText;
	
	public void saveText(String text) {
		payloadText = text;
	}

	@Override
	public String getPayload() {
			
		return payloadText;
	}

	@Override
	public int getPayloadLength() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean isLast() {
		// TODO Auto-generated method stub
		return false;
	}
	
}
