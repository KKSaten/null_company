package com.team2.app.haerin.vacation;

import java.lang.ProcessBuilder.Redirect;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.app.employee.EmployeeVO;
import com.team2.app.haerin.commute.CommuteVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/vacation/*")
public class VacationController {
	@Autowired
	private VacationService vacationService;
	
	//사용자 휴가 신청
	@GetMapping("myVacation")
	public void myVacation(Model model) throws Exception{
		// 로그인한 사용자 아이디 가져오기
				SecurityContext context = SecurityContextHolder.getContext();
				Authentication authentication = context.getAuthentication();
				EmployeeVO temp = (EmployeeVO) authentication.getPrincipal();
				VacationVO vacationVO = new VacationVO();
				vacationVO.setEmpNum(temp.getEmpNum());
		
				List<VacationVO>list = vacationService.myListDetail(vacationVO);
				model.addAttribute("ar",list);
				List<VacationVO> ar = vacationService.myVacation(vacationVO);
			
				model.addAttribute("list", ar);

	}

	
	//전체 사원 잔여 휴가 리스트
	@GetMapping("list")
	public void list(Model model) throws Exception{
		List<VacationVO>list = vacationService.list();
		model.addAttribute("list",list);
		
	}
	@PostMapping("list")
	public String updateVacation(VacationVO vacationVO)throws Exception{
		    // 휴가 정보를 업데이트하는 로직을 추가하세요.
			
		    // 업데이트가 완료되면 원하는 페이지로 리다이렉트하거나 모델에 데이터를 추가할 수 있습니다.
			vacationService.updateVacation(vacationVO);
		    return "redirect:/vacation/list";  // 필요한 페이지로 리다이렉트합니다.
		}
	
	
	//관리자 휴가 신청 내역 리스트
	@GetMapping("listDetail")
	public void listDetail(Model model) throws Exception{
		List<VacationVO>list = vacationService.listDetail();
		model.addAttribute("list",list);
		
	}

	@PostMapping("/vacation/vacationAdd")
	public String vacationAdd(@RequestParam("vacationStartDate") String vacationStartDateStr,
	                          @RequestParam("vacationEndDate") String vacationEndDateStr,
	                          @ModelAttribute VacationVO vacationVO) throws Exception {

	    // 날짜 형식 지정
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	    // String을 java.util.Date로 변환
	    java.util.Date vacationStartDateUtil = sdf.parse(vacationStartDateStr);
	    java.util.Date vacationEndDateUtil = sdf.parse(vacationEndDateStr);

	    // java.util.Date를 java.sql.Date로 변환
	    java.sql.Date vacationStartDate = new java.sql.Date(vacationStartDateUtil.getTime());
	    java.sql.Date vacationEndDate = new java.sql.Date(vacationEndDateUtil.getTime());

	    // 로그인한 사용자 아이디 가져오기
	    SecurityContext context = SecurityContextHolder.getContext();
	    Authentication authentication = context.getAuthentication();
	    EmployeeVO temp = (EmployeeVO) authentication.getPrincipal();
	    vacationVO.setEmpNum(temp.getEmpNum());

	    // vacationVO 내의 vacationCountVO를 가져오기
	    VacationCountVO vacationCountVO = vacationVO.getVacationCountVO();
	    
	    // vacationCountVO가 null인 경우 새로 생성하여 할당
	    if (vacationCountVO == null) {
	        vacationCountVO = new VacationCountVO();
	        vacationVO.setVacationCountVO(vacationCountVO);
	    }

	    // vacationStartDate와 vacationEndDate를 vacationCountVO에 설정
	    vacationCountVO.setVacationStartDate(vacationStartDate);
	    vacationCountVO.setVacationEndDate(vacationEndDate);

	    // vacationAdd 로직 처리
	    vacationService.vacationAdd(vacationVO);

	    return "redirect:/vacation/list";  // 적절한 리다이렉트
	}


}
