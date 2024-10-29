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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.app.employee.EmployeeVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;

	
	@GetMapping("approvalReceivedbox")
	public void approvalReceivedbox(Model model) throws Exception {
		
	}	
	
	@GetMapping("approvalDocbox")
	public void approvalDocbox(@AuthenticationPrincipal EmployeeVO empVO, ApprDocVO appr, Model model, HttpSession session) throws Exception {
		
		//접속 중인 ID의 정보를 @AuthenticationPrincipal로 가져옴
		
		List<ApprDocVO> list = approvalService.getList(empVO); 
		for(ApprDocVO li : list) {
			log.info("list :" + ""+li.getApprLineVO().size());
		}
		model.addAttribute("list", list);
		
		
		List<DocTypeVO> docList = approvalService.getDocType();
		for(DocTypeVO dcli : docList) {
			log.info("docList :" + dcli.getDocTemplateVO().size());
		}
		model.addAttribute("docList", docList);
		 
		
	}
	

	@GetMapping("write")
	public String writePage(@AuthenticationPrincipal EmployeeVO empVO, Model model) throws Exception {
		
		model.addAttribute("empVO", empVO);
		
		//서명 모달창
		List<SignVO> signList = approvalService.signList(empVO);	
		model.addAttribute("signList", signList);
		
		return "approval/draftDoc";
		
	}
	
	@PostMapping("write")
	public void write(@AuthenticationPrincipal EmployeeVO empVO, Model model) throws Exception {
		
		
		
	}
	
	
	
	
	
	
	
	
	@GetMapping("signaturePad")
	public void sign(@AuthenticationPrincipal EmployeeVO empVO, Model model) throws Exception {
		
		List<SignVO> signList = approvalService.signList(empVO);
		
		model.addAttribute("signList", signList);	
		
	}
	
	@GetMapping("signaturePad/list")
	@ResponseBody
	public List<SignVO> signList(@AuthenticationPrincipal EmployeeVO empVO, Model model) throws Exception {
		
		List<SignVO> signList = approvalService.signList(empVO);
		
		return signList;	
	}
	
	@PostMapping("signaturePad/setDefaultSign")
	@ResponseBody
	public int setDefaultSign(@AuthenticationPrincipal EmployeeVO empVO, SignVO signVO) throws Exception {
		
		signVO.setSignUser(empVO.getEmpNum());
		
		int result = approvalService.setDefaultSign(signVO);
		
		log.info("setDefaultSign Result: " + result);
		
		return result;
	}
	
	
	@PostMapping("signaturePad/deleteSign")
	@ResponseBody
	public int deleteSign(@AuthenticationPrincipal EmployeeVO empVO, SignVO signVO) throws Exception {
		
		int result = approvalService.deleteSign(signVO);
		
		return result;
	}	
	
	
	@PostMapping("signaturePad/canvas")
	@ResponseBody // 왜 쓴건지 까먹어서 적어두는 주석
		// 해당 메서드의 반환값을 HTTP 응답의 본문에 직접 작성하도록 지시하는 어노테이션
		// 이 어노테이션이 없으면 기본적으로 뷰 이름(예: JSP 파일)으로 해석되며, 클라이언트에 HTML 형식의 응답을 전송하게 됨
		// @ResponseBody를 사용하면 메서드의 반환값이 JSON 형태로 클라이언트에 직접 전송되므로
		// 비동기식 요청(예: AJAX)에서 데이터를 처리할 때 유용함
		// 반환값이 void일 경우, 클라이언트는 응답 본문을 받을 수 없으므로
		// 반드시 JSON 형태의 데이터를 반환해야 클라이언트 측에서 response.json()으로 처리할 수 있게 되는 것
	public List<SignVO> saveSign(@AuthenticationPrincipal EmployeeVO empVO,
						@ModelAttribute SignVO signVO,
						Model model) throws Exception {
		
		signVO.setSignUser(empVO.getEmpNum());
		
		log.info("sign : " + signVO.getSignTitle());
		
		int result = approvalService.saveSign(signVO);
		
		List<SignVO> signList = approvalService.signList(empVO);
		
		return signList;
		
	}
	

	
	
}
