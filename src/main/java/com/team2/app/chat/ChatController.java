package com.team2.app.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
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
	public void getList(Model model) throws Exception {
		List<RoomVO> roomList = chatService.getList();
		
		List<DepartmentVO> deptList = departmentService.getList();
		List<EmployeeVO> empList = employeeService.empList();
		
		model.addAttribute("roomList", roomList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		
	}
	
    @PostMapping("add")
    public void add() throws Exception {
    }
    
    @ResponseBody
    @PostMapping("getEmp")
    public List<EmployeeVO> getEmp(@RequestBody DepartmentVO departmentVO) throws Exception {
    	
    	log.info("dept vo : {}", departmentVO);
    	List<EmployeeVO> empList = chatService.empList(departmentVO);
    	
    	return empList;
    }
    
    @GetMapping("test")
    public void test() throws Exception {
    }
	
    @GetMapping("room")
    public void room() throws Exception {
    }
	
}
