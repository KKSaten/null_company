package com.team2.app.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	// ============================== 인사
	
	@GetMapping("list")
	public void getList(Model model) throws Exception {
		List<EmployeeVO> list = employeeService.getList();
		
		model.addAttribute("list", list);
	} 
	
	@GetMapping("detail")
	public void getdetail(EmployeeVO employeeVO, Model model) throws Exception {
		employeeVO = employeeService.getDetail(employeeVO);
		model.addAttribute("vo", employeeVO);
	}
	
	@GetMapping("delete")
	public void delete(EmployeeVO employeeVO) throws Exception {
		int result = employeeService.delete(employeeVO);
	}
	
	
	// ============================== 직원
	
	@GetMapping("update")
	public void update() throws Exception {
		
	}
	
	@PostMapping("update")
	public void update(EmployeeVO employeeVO, MultipartFile attach) throws Exception {
		employeeService.update(employeeVO, attach);
	}
	
	//비밀번호 변경
	@GetMapping("chpass")
	public void chpass() throws Exception {
		
	}
	
	@PostMapping("chpass")
	public String chpass(EmployeeVO employeeVO, String befpass, HttpSession session) throws Exception {
		
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");

		SecurityContext sc = SecurityContextHolder.getContext();
		Authentication ac = sc.getAuthentication();
		EmployeeVO vo = (EmployeeVO) ac.getPrincipal();
		
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
	}
	
	@PostMapping("join")
	public void join(EmployeeVO employeeVO, RoleVO roleVO, MultipartFile attach) throws Exception {
			
		log.info("=========================================");
		log.info("join employee: {}", employeeVO);
		
		employeeService.join(employeeVO, roleVO, attach);
			
		log.info("=========================================");
		log.info("등록 성공");
		
	}

	@GetMapping("fileDown")
	public String fileDown(HttpSession session, Model model) throws Exception {
		
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");

		SecurityContext sc = SecurityContextHolder.getContext();
		Authentication ac = sc.getAuthentication();
		EmployeeVO employeeVO = (EmployeeVO) ac.getPrincipal();
		
		model.addAttribute("file",employeeVO.getEmployeeFileVO());
		
		return "fileDown";
	}

	@GetMapping("login")
	public void login() throws Exception {
	}

	@GetMapping("mypage")
	public void mypage(HttpSession session, Model model) {
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
		log.info("Detail: {}", ac.getDetails()); // sessionID
		
		model.addAttribute("vo",employeeVO);

	}
	@GetMapping("empList")
	public void empList(Model model) throws Exception{
		
		List<EmployeeVO> employeeVO = employeeService.empList();
		model.addAttribute("list",employeeVO);
	}
}
