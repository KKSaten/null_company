package com.team2.app.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.app.employee.EmployeeVO;

@Service
public class ScheduleService {

	
	@Autowired
	private ScheduleMapper scheduleMapper;
	
	
	public List<ScheduleVO> getList(EmployeeVO employeeVO) throws Exception{
		
		return scheduleMapper.getList(employeeVO);
	}
}
