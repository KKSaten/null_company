package com.team2.app.haerin.commute;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public void checkIn(CommuteVO commuteVO) throws Exception {
	    // 로그인한 사용자 아이디 가져오기
	    SecurityContext context = SecurityContextHolder.getContext();
	    Authentication authentication = context.getAuthentication();
	    commuteVO.setEmpNum(authentication.getName());
	    
	    // 출근 가능 여부 확인
	    if (commuteService.canCheckIn(commuteVO)) {
	        int result = commuteService.checkIn(commuteVO);
	        log.info("출근 완료");
	    } else {
	        log.info("이미 출근한 상태입니다.");
	        // 적절한 예외 처리나 알림 메시지 반환
	    }
	}

	@PostMapping("checkOut")
	public void checkOut(CommuteVO commuteVO) throws Exception {
	    // 로그인한 사용자 아이디 가져오기
	    SecurityContext context = SecurityContextHolder.getContext();
	    Authentication authentication = context.getAuthentication();
	    commuteVO.setEmpNum(authentication.getName());
	    
	    // 퇴근 가능 여부 확인
	    if (commuteService.canCheckOut(commuteVO)) {
	        int result = commuteService.checkOut(commuteVO);
	        log.info("퇴근 완료");
	    } else {
	        log.info("이미 퇴근했거나 출근 기록이 없습니다.");
	        // 적절한 예외 처리나 알림 메시지 반환
	    }
	}
	
	

}
