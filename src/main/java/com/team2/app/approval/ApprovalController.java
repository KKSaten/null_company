package com.team2.app.approval;

import java.util.Enumeration;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.app.employee.EmployeeVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	@GetMapping("approvalDraftbox")
	public void approvalDraftbox(Model model) throws Exception {
		
	}
	
	@GetMapping("approvalDocbox")
	public void approvalDocbox(Model model, ApprDocVO appr, HttpSession session) throws Exception {
		
		/* 아이디 추출 과정 */
		
		Enumeration<String> en = session.getAttributeNames();
		while(en.hasMoreElements()) {
			String name = en.nextElement();
		}
		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		EmployeeVO empVO= (EmployeeVO)authentication.getPrincipal();
	
		/* 아이디 추출 과정 끝 */
		
		
		List<ApprDocVO> list = approvalService.getList(empVO); 
		model.addAttribute("list", list);
	}
	
	@GetMapping("approvalReceivedbox")
	public void approvalReceivedbox(Model model) throws Exception {
		
	}

}
