package com.team2.app.employee;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team2.app.department.DepartmentVO;
import com.team2.app.notification.NotificationService;
import com.team2.app.notification.NotificationType;
import com.team2.app.notification.NotificationVO;
import com.team2.app.positions.PositionsVO;
import com.team2.app.role.RoleVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/employee/*")
@Controller
@Slf4j
public class EmployeeContoller {
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	NotificationService notificationService;
	
	// ============================== 인사
	
	@GetMapping("test")
	public void test(EmployeeVO employeeVO, HttpSession session) throws Exception {
		NotificationVO notificationVO = new NotificationVO();
		
		employeeVO = employeeService.detail(employeeVO);
		notificationVO.setEmployeeVO(employeeVO);
		
		log.info("vo:{}",employeeVO);
		
		notificationService.send(notificationVO);
	}
	
	@GetMapping("list")
	public void getList(Model model) throws Exception {
		List<EmployeeVO> list = employeeService.getList();
		
		model.addAttribute("list", list);
	} 
	
	@GetMapping("delete")
	public void delete(EmployeeVO employeeVO) throws Exception {
		int result = employeeService.delete(employeeVO);
	}
	
	
	// ============================== 직원
	
	@ResponseBody
	@PostMapping("update")
	public int update(MultipartFile attach, String empAddress, HttpSession session) throws Exception {
		log.info("update: {}", empAddress);
		int result = 0;
		EmployeeVO employeeVO = getEmployeeVO(session);
		employeeVO.setEmpAddress(empAddress);
		result = employeeService.update(employeeVO, attach);
		
		log.info("update: {}",result);
		
		return result;
	}
	
	//비밀번호 변경
	@GetMapping("chpass")
	public void chpass() throws Exception {
		
	}
	
	@PostMapping("chpass")
	public String chpass(EmployeeVO employeeVO, String befpass, HttpSession session) throws Exception {
				
		EmployeeVO vo = getEmployeeVO(session);
		
		if(!passwordEncoder.matches(befpass, vo.getEmpPwd())) {
			return "index";
		} else if (!employeeVO.getEmpPwd().equals(employeeVO.getEmpPwdCheck())) {
			log.warn("pwdcheck");
			return "index";
		}
		
		employeeVO.setEmpId(vo.getEmpId());
		
		employeeService.chpass(employeeVO);
		
		return "redirect:/employee/login";
	}
	

	@GetMapping("join")
	public void join(Model model) throws Exception {
		
		//사번 자동생성
		
		EmployeeVO employeeVO = new EmployeeVO();
		
		LocalDateTime localDateTime = LocalDateTime.now();
		
		log.info("date : {}", localDateTime);
		
		String empId = "";
		
		empId = Integer.toString(localDateTime.getYear());
		
		empId = empId.substring(2)+localDateTime.getMinute()+localDateTime.getSecond();
		
		log.info("empId : {}", empId);
		
		Map<String, Object> map =new HashMap<>();
		
		List<DepartmentVO> deptList = employeeService.getDept(null);
		List<PositionsVO> posList = employeeService.getPos(null);
		List<RoleVO> roleList = employeeService.getRole(null);
		
		map.put("empId", empId);
		map.put("deptList", deptList);
		map.put("posList", posList);
		map.put("roleList", roleList);
		
		model.addAttribute("map", map);
		
	}
	
	@PostMapping("join")
	public void join(EmployeeVO employeeVO, MultipartFile attach) throws Exception {
			
		log.info("=========================================");
		log.info("join employee: {}", employeeVO);
		
		employeeService.join(employeeVO, attach);
			
		log.info("=========================================");
		log.info("등록 성공");
		
	}

	@GetMapping("fileDown")
	public String fileDown(HttpSession session, Model model) throws Exception {
		
		EmployeeVO employeeVO = getEmployeeVO(session);
		
		model.addAttribute("file",employeeVO.getEmployeeFileVO());
		
		return "fileDown";
	}

	@GetMapping("login")
	public void login() throws Exception {
	}

	@GetMapping("detail")
	public void detail(EmployeeVO employeeVO ,HttpSession session, Model model) throws Exception {
		
		if(employeeVO.getEmpId() == null) {
			employeeVO = getEmployeeVO(session);
		} else {
			employeeVO = employeeService.detail(employeeVO);			
		}
		model.addAttribute("vo", employeeVO);
	}
	
	@GetMapping("empList")
	public void empList(Model model) throws Exception{
		
		List<EmployeeVO> list = employeeService.empList();
		model.addAttribute("list", list);
	}
	
	//session에서 로그인한 유저 정보 꺼내오는 메소드
	private EmployeeVO getEmployeeVO(HttpSession session) throws Exception {
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");

		SecurityContext sc = SecurityContextHolder.getContext();
		log.info("========= sc =========");
		log.info("sc: {}", sc);

		Authentication ac = sc.getAuthentication();
		log.info("========= ac =========");
		log.info("ac: {}", ac);

		EmployeeVO employeeVO = (EmployeeVO) ac.getPrincipal();
		log.info("========= memberVO =========");
		log.info("MemberVO: {}", employeeVO);
		log.info("Name: {}", ac.getName()); // username
		log.info("Detail: {}", ac.getDetails()); // sessionID\
		
		return employeeVO;
	}
}
