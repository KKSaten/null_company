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
	
	@GetMapping("myVacation")
	public void myVacation() throws Exception{
		
	}
	@GetMapping("list")
	public void list() throws Exception{
		
	}
	@GetMapping("listDetail")
	public void listDetail() throws Exception{
		
	}
}
