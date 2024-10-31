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
	
	public int getEmpNUm(ScheduleVO scheduleVO) throws Exception{
		
		return scheduleMapper.getEmpNum(scheduleVO);
	}
	
	public int modifySchedule(ScheduleVO scheduleVO) throws Exception{
		
		return scheduleMapper.modifySchedule(scheduleVO);
	}
	
	public int deleteSchedule(ScheduleVO scheduleVO) throws Exception{
		
		return scheduleMapper.deleteSchedule(scheduleVO);
	}
	
	public int writeSchedule(ScheduleVO scheduleVO) throws Exception{
		
		return scheduleMapper.writeSchedule(scheduleVO);
	}
	
	public int dragUpdateSchedule(ScheduleVO scheduleVO) throws Exception{
		
		return scheduleMapper.dragUpdateSchedule(scheduleVO);
	}
	
	public List<ScheduleVO> previewSchedule(EmployeeVO employeeVO) throws Exception{
		
		return scheduleMapper.previewSchedule(employeeVO);
	}
}
