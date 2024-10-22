package com.team2.app.approval;

import java.util.Enumeration;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@GetMapping("approvalReceivedbox")
	public void approvalReceivedbox(Model model) throws Exception {
		
	}	
	
	@GetMapping("approvalDocbox")
	public void approvalDocbox(@AuthenticationPrincipal EmployeeVO empVO, ApprDocVO appr, Model model, HttpSession session) throws Exception {
		
		/*
		 * 접속 중인 ID의 정보를 @AuthenticationPrincipal로 가져옴
		 */
		
		List<ApprDocVO> list = approvalService.getList(empVO); 
		for(ApprDocVO li : list) {
			log.info("list :" + ""+li.getApprLineVO().size());
		}
		model.addAttribute("list", list);
		
		
		List<DocTypeVO> docList = approvalService.getDocType();
		for(DocTypeVO dcli : docList) {
			log.info("docList :" + ""+ dcli.getDocTemplateVO().size());
		}
		model.addAttribute("docList", docList);
		 
		
	}
	

	@GetMapping("write")
	public String write(@AuthenticationPrincipal EmployeeVO empVO, Model model) throws Exception {
		
		model.addAttribute("empVO", empVO);
		
		return "approval/draftDoc";
		
	}
	
	
	@GetMapping("signaturePad")
	public void sign(@AuthenticationPrincipal EmployeeVO empVO, Model model) throws Exception {
		
		model.addAttribute("empVO", empVO);
		
	}
	
	@PostMapping("signaturePad")
	public void saveSign(@AuthenticationPrincipal EmployeeVO empVO, Model model) throws Exception {
		
		model.addAttribute("empVO", empVO);
		
	}
	
	
}
