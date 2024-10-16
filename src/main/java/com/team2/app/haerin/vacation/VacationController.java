package com.team2.app.haerin.vacation;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.java.Log;

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
	public void list(Model model) throws Exception{
		List<VacationVO>list = vacationService.list();
		model.addAttribute("list",list);
		
	}
	@PostMapping("list")
	public String updateVacation(@Param("empNum") String empNum, @Param("vacationLeftoverDate") String vacationLeftoverDate)throws Exception{
		    // 휴가 정보를 업데이트하는 로직을 추가하세요.
			
		    // 업데이트가 완료되면 원하는 페이지로 리다이렉트하거나 모델에 데이터를 추가할 수 있습니다.
			vacationService.updateVacation(empNum,vacationLeftoverDate);
		    return "redirect:/vacation/list";  // 필요한 페이지로 리다이렉트합니다.
		}
	
	
	//관리자 휴가 신청 내역 리스트
	@GetMapping("listDetail")
	public void listDetail(Model model) throws Exception{
		List<VacationVO>list = vacationService.listDetail();
		model.addAttribute("list",list);
		
	}
	
	
}
