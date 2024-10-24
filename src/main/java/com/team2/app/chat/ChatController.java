package com.team2.app.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.app.employee.EmployeeVO;

@RequestMapping("/chat/*")
@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@GetMapping("list")
	public void getList(Model model) throws Exception {
		List<RoomVO> list = chatService.getList();
		
		model.addAttribute("list", list);
	}
	
    @GetMapping("test")
    public void test() throws Exception {
    }
	
    @GetMapping("room")
    public void room() throws Exception {
    }
	
}
