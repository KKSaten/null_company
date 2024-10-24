package com.team2.app.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {
	
	@Autowired
	ChatMapper chatMapper;
	
	public List<RoomVO> getList() throws Exception {
		return chatMapper.getList(); 
	}
}
