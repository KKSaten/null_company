package com.team2.app.schedule;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.employee.EmployeeVO;

@Mapper
public interface ScheduleMapper {
	
	
	List<ScheduleVO> getList(EmployeeVO employeeVO) throws Exception;
	
		int getEmpNum(ScheduleVO scheduleVO) throws Exception;
	
	int modifySchedule(ScheduleVO scheduleVO) throws Exception;
	
	int deleteSchedule(ScheduleVO scheduleVO) throws Exception;
	
	int writeSchedule(ScheduleVO scheduleVO) throws Exception;
	
	int dragUpdateSchedule(ScheduleVO scheduleVO) throws Exception;

}
