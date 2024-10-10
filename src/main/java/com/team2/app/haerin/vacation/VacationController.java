package com.team2.app.haerin.vacation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vacation/*")
public class VacationController {
	@Autowired
	private VacationService vacationService;
	
	//사용자 휴가 신청
	@GetMapping("myVacation")
	public void myVacation() throws Exception{
		
	}
	
	//전체 사원 잔여 휴가 리스트
	@GetMapping("list")
	public void list() throws Exception{
		
	}
	
	//관리자 휴가 신청 내역 리스트
	@GetMapping("listDetail")
	public void listDetail() throws Exception{
		
	}
}
