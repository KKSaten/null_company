package com.team2.app.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	@GetMapping("approvalDocbox")
	public void approvalDocbox(Model model) throws Exception {
		
	}

}
