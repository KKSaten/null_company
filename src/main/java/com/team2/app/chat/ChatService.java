package com.team2.app.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.app.department.DepartmentVO;
import com.team2.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatService {
	
	@Autowired
	ChatMapper chatMapper;
	
	public List<RoomVO> getList() throws Exception {
		return chatMapper.getList(); 
	}
	
	public int makeRoom(RoomVO roomVO) throws Exception {
		int result = chatMapper.makeRoom(roomVO);
		
		log.info("makeRoom Service vo : {}", roomVO);
		
		return result;
	}
	
	public EmployeeVO getEmpDetail(EmployeeVO employeeVO) throws Exception {
		return chatMapper.getEmpDetail(employeeVO);
	}
	
	public List<EmployeeVO> empList(DepartmentVO departmentVO) throws Exception {
		return chatMapper.empList(departmentVO);
	}

}
