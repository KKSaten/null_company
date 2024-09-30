package com.team2.app.haerin.commute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/commute/*")
public class CommuteController {
//	@Autowired
//	private CommuteService commuteService;
	
	//출근 


	@GetMapping("checkIn")
	public String checkIn(String empNum ) {
		return "redirect:/";
	}
	//퇴근
	@GetMapping("checkOut")
	public String checkOut() {
		return "redirect:/";
		}
}
