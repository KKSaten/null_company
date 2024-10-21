package com.team2.app.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.app.employee.EmployeeVO;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {

	
	@Autowired
	private ScheduleService scheduleService;
	
	
	@GetMapping("calendar")
	public void getCalendar() throws Exception{}
	
	
	@GetMapping("calendarList")
	@ResponseBody
	public List<ScheduleVO> getCalenderList(@AuthenticationPrincipal EmployeeVO employeeVO) throws Exception{
		
		List<ScheduleVO> list = scheduleService.getList(employeeVO);
		
		return list;	
	}
}
