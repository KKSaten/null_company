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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.app.employee.DeptEmpVO;
import com.team2.app.employee.EmployeeService;
import com.team2.app.employee.EmployeeVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	@Autowired
	private EmployeeService employeeService;

	
	@GetMapping("approvalReceivedbox")
	public void approvalReceivedbox(Model model) throws Exception {
		
	}	
	
	// 기안 상신함
	@GetMapping("approvalDocbox")
	public void approvalDocbox(@AuthenticationPrincipal EmployeeVO empVO, ApprDocVO appr, Model model, HttpSession session) throws Exception {
		
		//접속 중인 ID의 정보를 @AuthenticationPrincipal로 가져옴
		
		// 기안서 리스트
		List<ApprDocVO> list = approvalService.getList(empVO); 
//		for(ApprDocVO li : list) {
//			log.info("list :" + ""+li.getApprLineVO().size());
//		}
		model.addAttribute("list", list);
		
		// 기안서 작성시 문서 유형 리스트
		List<DocTypeVO> docList = approvalService.getDocType();
//		for(DocTypeVO dcli : docList) {
//			log.info("docList :" + dcli.getDocTemplateVO().size());
//		}
		model.addAttribute("docList", docList);	
	}
	
	
	// 기안서 작성 페이지
	@GetMapping("write")
	public String writePage(@AuthenticationPrincipal EmployeeVO empVO, ApprDocVO apprDocVO, Model model) throws Exception {
		
		model.addAttribute("empVO", empVO);
		
		// 서명 리스트 모달
		List<SignVO> signList = approvalService.signList(empVO);	
		model.addAttribute("signList", signList);
		
		// 결재선 사원 리스트 모달
		List<DeptEmpVO> deptEmpList = employeeService.deptEmpList();
		model.addAttribute("deptEmpList", deptEmpList);
		
		// 문서 타입
		model.addAttribute("apprDocVO", apprDocVO);
		
		
		return "approval/draftDoc";
		
	}
	
	@PostMapping("write")
	@ResponseBody
	public int write(@AuthenticationPrincipal EmployeeVO empVO, ApprDocVO apprDocVO, ApprLineVO apprLineVO,
				@RequestParam Integer[] approver, Model model) throws Exception {
		
		int result = 0;
		
		result = approvalService.draftDoc(apprDocVO);
		
		Long generatedDocNum = apprDocVO.getDocNum();
		
		apprLineVO.setDocNum(generatedDocNum);
		
		if(approver.length == 0) {
			log.error("결재자가 없습니다");
			return 0;
		}
		else if(approver.length >= 1) {
			int i = 1;
			for(Integer appr : approver) {
				if(appr == null) {
					break;
				}
				apprLineVO.setApprover(appr);
				apprLineVO.setApprTurn(i);
				int r = approvalService.saveApprLine(apprLineVO);
				i++;
				
				result += r*10;
			}
		}
		
		
		return result;
		
	}
	
	
	
	
	
	
	
	// 서명 관리 페이지
	@GetMapping("signaturePad")
	public void sign(@AuthenticationPrincipal EmployeeVO empVO, Model model) throws Exception {
		
		List<SignVO> signList = approvalService.signList(empVO);
		
		model.addAttribute("signList", signList);	
		
	}
	
	// 기안서 작성시 서명 리스트 모달
	@GetMapping("signaturePad/list")
	@ResponseBody
	public List<SignVO> signList(@AuthenticationPrincipal EmployeeVO empVO, Model model) throws Exception {
		
		List<SignVO> signList = approvalService.signList(empVO);
		
		return signList;	
	}
	
	
	// 대표 서명 설정
	@PostMapping("signaturePad/setDefaultSign")
	@ResponseBody
	public int setDefaultSign(@AuthenticationPrincipal EmployeeVO empVO, SignVO signVO) throws Exception {
		
		signVO.setSignUser(empVO.getEmpNum());
		
		int result = approvalService.setDefaultSign(signVO);
		
		log.info("setDefaultSign Result: " + result);
		
		return result;
	}
	
	
	// 기안서 작성시 대표 설정된 서명 불러오기
	@PostMapping("signaturePad/getDefaultSign")
	@ResponseBody
	public SignVO getDefaultSign(@AuthenticationPrincipal EmployeeVO empVO, SignVO signVO) throws Exception {
		
		signVO.setSignUser(empVO.getEmpNum());
		
		signVO = approvalService.getDefaultSign(signVO);
		
		log.info("getDefaultSign Result: " + signVO);
		
		return signVO;
	}	
	
	// 서명 삭제
	@PostMapping("signaturePad/deleteSign")
	@ResponseBody
	public int deleteSign(@AuthenticationPrincipal EmployeeVO empVO, SignVO signVO) throws Exception {
		
		int result = approvalService.deleteSign(signVO);
		
		return result;
	}	
	
	// 서명 작성 
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
