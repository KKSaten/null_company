package com.team2.app.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.team2.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/schedule/*")
@Slf4j
public class ScheduleController {
	
	@Value("${google.calendar.api-key}")
	private String googleCalendarApiKey;
	
	@Value("${google.Calendar.Id}")
	private String googleCalendarId;
	
	@Autowired
	private ScheduleService scheduleService;
	
	
	@GetMapping("apiKey")
	@ResponseBody
	public Map<String, String> getApiKey() {
		
		return Map.of(
				"apiKey", googleCalendarApiKey,
				"calendarId", googleCalendarId
				);
	}
	
	
	@GetMapping("calendar")
	public void getCalendar() throws Exception{
		// calendar 페이지로 접근만 하는 메서드, 스크립트의 Full calendar 함수들이 자동으로 렌더링 실시
	}
	
	@GetMapping("calendarList")
	@ResponseBody
	public List<ScheduleVO> getCalenderList(@AuthenticationPrincipal EmployeeVO employeeVO) throws Exception{
		
		// JSON 형태로 응답을 내보내면 스크립트에서 받아서 처리한 다음 추가로 렌더링 실시
		List<ScheduleVO> list = scheduleService.getList(employeeVO);
		
		return list;
	}
	
	@PostMapping("modify")
	public String modifySchedule(@AuthenticationPrincipal EmployeeVO employeeVO ,ScheduleVO scheduleVO, Model model) throws Exception{
		
		
		/* 로그인한 사용자와 일정 작성자가 일치하는지 확인하는 코드 */
		int empNum = scheduleService.getEmpNUm(scheduleVO);
		
		if(employeeVO.getEmpNum() != empNum) {
			model.addAttribute("result", "타인의 일정은 수정이 불가능합니다.");
			model.addAttribute("url", "/schedule/calendar");
			
			return "commons/message";
		}
		
		int result = scheduleService.modifySchedule(scheduleVO);
		
		return "redirect:/schedule/calendar";
	}
	
	@GetMapping("delete")
	public String deleteSchedule(@AuthenticationPrincipal EmployeeVO employeeVO ,ScheduleVO scheduleVO, Model model) throws Exception{
		
		/* 로그인한 사용자와 일정 작성자가 일치하는지 확인하는 코드 */
		int empNum = scheduleService.getEmpNUm(scheduleVO);
		
		if(employeeVO.getEmpNum() != empNum) {
			model.addAttribute("result", "타인의 일정은 삭제할 수 없습니다.");
			model.addAttribute("url", "/schedule/calendar");
			
			return "commons/message";
		}
		
		int result = scheduleService.deleteSchedule(scheduleVO);
		
		return "redirect:/schedule/calendar";
	}
	
	@PostMapping("write")
	public String writeSchedule(@AuthenticationPrincipal EmployeeVO employeeVO, ScheduleVO scheduleVO) throws Exception{
		
		scheduleVO.setEmpNum(employeeVO.getEmpNum());
		
		int result = scheduleService.writeSchedule(scheduleVO);
		
		return "redirect:/schedule/calendar";
	}
	
	
	// 일정을 '드래그 앤 드랍'으로 수정할 때 작동하는 메서드
	@PutMapping("dragUpdate")
	@ResponseBody
	public String dragUpdateSchedule(@AuthenticationPrincipal EmployeeVO employeeVO, @RequestBody Map<String, Object> map) throws Exception{
		
		// AJAX로 받아온 JSON타입의 파라미터를 VO에 맞게 형변환을 거쳐 넣어준다
		ScheduleVO scheduleVO = new ScheduleVO();
		
		String temp = map.get("id").toString();
		
		scheduleVO.setScheduleNum(Long.parseLong(temp));
		
		/* 로그인한 사용자와 일정 작성자가 일치하는지 확인하는 코드 */
		int empNum = scheduleService.getEmpNUm(scheduleVO);
		
		if(employeeVO.getEmpNum() != empNum) {		
			return "fail";
		}
		
		scheduleVO.setScheduleStart(map.get("start").toString().substring(0, 10));
		scheduleVO.setScheduleEnd(map.get("end").toString().substring(0, 10));
		
		int result = scheduleService.dragUpdateSchedule(scheduleVO);
		
		if(result > 0) {
			return "success";
		}else {
	        return "fail";
		}	
	}
	
	
	@GetMapping("preview")
	public void previewSchedule(@AuthenticationPrincipal EmployeeVO employeeVO, Model model) throws Exception{
		
		List<ScheduleVO> list = scheduleService.previewSchedule(employeeVO);
		
		model.addAttribute("list", list);
	}
}
