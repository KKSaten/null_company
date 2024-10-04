package com.team2.app.haerin.commute;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;






@Controller
@RequestMapping("/commute/*")
public class CommuteController {
	@Autowired
	private CommuteService commuteService;
	
	//출근 
	@GetMapping("checkIn")
	public String checkIn( ) {
		return "redirect:/";
	}
	
	//퇴근
	@GetMapping("checkOut")
	public String checkOut() {
		return "redirect:/";
		}
	@GetMapping("list")
	public void checkList(Model model )throws Exception {
		List<CommuteVO> commuteVO =commuteService.checkList(); 
		model.addAttribute("list",commuteVO);
			
	}
	

    @PostMapping("checkIn")
    public ResponseEntity<String> checkIn(@PathVariable String empNum) throws Exception {
        commuteService.clockIn(empNum);
        return ResponseEntity.ok("출근 처리 완료");
    }

    @PostMapping("checkOut")
    public ResponseEntity<String> checkOut(@PathVariable String empNum) throws Exception {
        commuteService.clockOut(empNum);
        return ResponseEntity.ok("퇴근 처리 완료");
    }
	
}
