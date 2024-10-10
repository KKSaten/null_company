package com.team2.app.haerin.commute;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.app.employee.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/commute/*")
public class CommuteController {
	@Autowired
	private CommuteService commuteService;

	// 출근
	@GetMapping("checkIn")
	public String checkIn() {
		return "redirect:/";
	}

	// 퇴근
	@GetMapping("checkOut")
	public String checkOut() {
		return "redirect:/";
	}

	// 관리자 근태 리스트
	@GetMapping("list")
	public void checkList(Model model) throws Exception {
		List<CommuteVO> commuteVO = commuteService.checkList();
		// 포맷터 생성
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		// 날짜와 시간 포맷팅
		commuteVO.forEach(commute -> {
			// commuteInTime 포맷팅
			if (commute.getCommuteInTime() != null) {
				String formattedInTime = commute.getCommuteInTime().format(formatter);
				commute.setFormattedCommuteInTime(formattedInTime); // 포맷된 체크인 시간 저장
			} else {
				commute.setFormattedCommuteInTime("미출근"); // 체크인 시간 없음 처리
			}

			// commuteOutTime 포맷팅
			if (commute.getCommuteOutTime() != null) {
				String formattedOutTime = commute.getCommuteOutTime().format(formatter);
				commute.setFormattedCommuteOutTime(formattedOutTime); // 포맷된 체크아웃 시간 저장
			} else {
				commute.setFormattedCommuteOutTime("미퇴근"); // 체크아웃 시간 없음 처리
			}
		});
		model.addAttribute("list", commuteVO);

	}

	// 사용자 근태 리스트
	@GetMapping("userList")
	public void userList(Model model) throws Exception {
		// 로그인한 사용자 아이디 가져오기
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		EmployeeVO temp = (EmployeeVO) authentication.getPrincipal();
		CommuteVO commuteVO = new CommuteVO();
		commuteVO.setEmpNum(temp.getEmpNum());
		List<CommuteVO> ar = commuteService.userList(commuteVO);

		// 포맷터 생성
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		// 날짜와 시간 포맷팅
		ar.forEach(commute -> {
			// commuteInTime 포맷팅
			if (commute.getCommuteInTime() != null) {
				String formattedInTime = commute.getCommuteInTime().format(formatter);
				commute.setFormattedCommuteInTime(formattedInTime); // 포맷된 체크인 시간 저장
			} else {
				commute.setFormattedCommuteInTime("미출근"); // 체크인 시간 없음 처리
			}

			// commuteOutTime 포맷팅
			if (commute.getCommuteOutTime() != null) {
				String formattedOutTime = commute.getCommuteOutTime().format(formatter);
				commute.setFormattedCommuteOutTime(formattedOutTime); // 포맷된 체크아웃 시간 저장
			} else {
				commute.setFormattedCommuteOutTime("미퇴근"); // 체크아웃 시간 없음 처리
			}
		});

		model.addAttribute("userList", ar);

	}

	// 출근 버튼 누른 중복 사람 확인
	@PostMapping("checkIn")
	public void checkIn(CommuteVO commuteVO) throws Exception {
		// 로그인한 사용자 아이디 가져오기
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		EmployeeVO temp = (EmployeeVO) authentication.getPrincipal();
		commuteVO.setEmpNum(temp.getEmpNum());

		// 출근 가능 여부 확인
		if (commuteService.canCheckIn(commuteVO)) {
			int result = commuteService.checkIn(commuteVO);
			log.info("출근 완료");
		} else {
			log.info("이미 출근한 상태입니다.");
			// 적절한 예외 처리나 알림 메시지 반환
		}
	}

	// 퇴근 버튼 누른 중복 사람 확인
	@PostMapping("checkOut")
	public void checkOut(CommuteVO commuteVO) throws Exception {
		// 로그인한 사용자 아이디 가져오기
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		EmployeeVO temp = (EmployeeVO) authentication.getPrincipal();
		commuteVO.setEmpNum(temp.getEmpNum());

		// 퇴근 가능 여부 확인
		if (commuteService.canCheckOut(commuteVO)) {
			int result = commuteService.checkOut(commuteVO);
			log.info("퇴근 완료");
		} else {
			log.info("이미 퇴근했거나 출근 기록이 없습니다.");
			// 적절한 예외 처리나 알림 메시지 반환
		}
	}
	
	//관리자 근태 수정
	@GetMapping("update")
	public void update(Model model)throws Exception {
		List<CommuteVO> commuteVO = commuteService.checkList();
		// 포맷터 생성
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		// 날짜와 시간 포맷팅
		commuteVO.forEach(commute -> {
			// commuteInTime 포맷팅
			if (commute.getCommuteInTime() != null) {
				String formattedInTime = commute.getCommuteInTime().format(formatter);
				commute.setFormattedCommuteInTime(formattedInTime); // 포맷된 체크인 시간 저장
			} else {
				commute.setFormattedCommuteInTime("미출근"); // 체크인 시간 없음 처리
			}

			// commuteOutTime 포맷팅
			if (commute.getCommuteOutTime() != null) {
				String formattedOutTime = commute.getCommuteOutTime().format(formatter);
				commute.setFormattedCommuteOutTime(formattedOutTime); // 포맷된 체크아웃 시간 저장
			} else {
				commute.setFormattedCommuteOutTime("미퇴근"); // 체크아웃 시간 없음 처리
			}
		});
		model.addAttribute("list", commuteVO);
		
	}
	@PostMapping("update")
	public String update(@RequestParam("empNum") Integer empNum, @RequestParam("commuteStatus") Integer commuteStatus)throws Exception {
	    commuteService.update(empNum, commuteStatus);
	    return "redirect:/commute/list";
	}



}
