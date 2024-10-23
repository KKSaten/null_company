package com.team2.app.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/schedule/*")
@Slf4j
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
	
	@PostMapping("modify")
	public String modifySchedule(ScheduleVO scheduleVO) throws Exception{
		
		int result = scheduleService.modifySchedule(scheduleVO);
		
		return "redirect:/schedule/calendar";
	}
	
	@GetMapping("delete")
	public String deleteSchedule(ScheduleVO scheduleVO) throws Exception{
		
		int result = scheduleService.deleteSchedule(scheduleVO);
		
		return "redirect:/schedule/calendar";
	}
	
	@PostMapping("write")
	public String writeSchedule(@AuthenticationPrincipal EmployeeVO employeeVO, ScheduleVO scheduleVO) throws Exception{
		
		scheduleVO.setEmpNum(employeeVO.getEmpNum());
		
		int result = scheduleService.writeSchedule(scheduleVO);
		
		return "redirect:/schedule/calendar";
	}
	
	
	@PutMapping("dragUpdate")
	@ResponseBody
	public String dragUpdateSchedule(@RequestBody Map<String, Object> map) throws Exception{
		
		ScheduleVO scheduleVO = new ScheduleVO();
		
		String temp = map.get("id").toString();
		
		scheduleVO.setScheduleNum(Long.parseLong(temp));
		scheduleVO.setScheduleStart(map.get("start").toString().substring(0, 10));
		scheduleVO.setScheduleEnd(map.get("end").toString().substring(0, 10));
		
		int result = scheduleService.dragUpdateSchedule(scheduleVO);
		
		if(result > 0) {
			return "success";
		}else {
	        return "fail";
		}
		
	}
}
