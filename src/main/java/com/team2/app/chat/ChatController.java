package com.team2.app.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.team2.app.department.DepartmentService;
import com.team2.app.department.DepartmentVO;
import com.team2.app.employee.EmployeeService;
import com.team2.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/chat/*")
@Controller
@Slf4j
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	EmployeeService employeeService;
	
	
	@GetMapping("list")
	public void getList(Model model, @AuthenticationPrincipal EmployeeVO employeeVO) throws Exception {
		List<RoomVO> roomList = chatService.getList(employeeVO);
		
		List<DepartmentVO> deptList = departmentService.getList();
		List<EmployeeVO> empList = employeeService.empList();
		
		model.addAttribute("roomList", roomList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		
	}
	
    @PostMapping("makeRoom")
    public String makeRoom(@RequestBody RoomVO roomVO, @AuthenticationPrincipal EmployeeVO employeeVO, Model model) throws Exception {
    	log.info("makeRoom vo {}", roomVO);
    	
    	List<RoomMemberVO> list = roomVO.getRoomMember();
    	RoomMemberVO roomMemberVO = new RoomMemberVO();
    	roomMemberVO.setEmpNum(employeeVO.getEmpNum());
    	list.add(roomMemberVO);
    	roomVO.setRoomMember(list);
    	
    	int result = chatService.makeRoom(roomVO);
    	
    	model.addAttribute("result", result);
    	
    	return "commons/result";
    }
	
    @GetMapping("room")
    public String room(RoomVO roomVO, Model model, @AuthenticationPrincipal EmployeeVO employeeVO) throws Exception {
    	chatService.chPreStatus(roomVO, employeeVO);
    	
    	roomVO = chatService.getRoomDetail(roomVO);
    	
    	List<RoomMemberVO> list = roomVO.getRoomMember();
    	
    	int count = 0;
    	
    	for(RoomMemberVO roomMemberVO:list) {
    		
    		if(roomMemberVO.getEmpNum() != employeeVO.getEmpNum()) {
    			count += 1;
    		}
    		
    	}
    	if(count == list.size()) {
    		model.addAttribute("result", "참여한 방이 아닙니다.");
    		model.addAttribute("url","/chat/list");
    		
    		return "commons/message";
    	}
    	
    	log.info("Room Detail : {}", roomVO);
    	log.info("Chat Detail : {}", roomVO.getChatList());
    	
    	
    	model.addAttribute("vo", roomVO);
    	
    	return "chat/room";
    }
    
    @ResponseBody
    @PostMapping("getEmpDetail")
    public EmployeeVO getEmpDetail (@RequestBody EmployeeVO employeeVO) throws Exception {
    	
    	employeeVO = chatService.getEmpDetail(employeeVO);
    	
    	return employeeVO;
    }
	
}
