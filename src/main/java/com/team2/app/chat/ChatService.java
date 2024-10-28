package com.team2.app.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.app.department.DepartmentVO;
import com.team2.app.employee.EmployeeVO;

@Service
public class ChatService {
	
	@Autowired
	ChatMapper chatMapper;
	
	public List<RoomVO> getList() throws Exception {
		return chatMapper.getList(); 
	}
	
	public List<EmployeeVO> empList(DepartmentVO departmentVO) throws Exception {
		return chatMapper.empList(departmentVO);
	}
	

}
