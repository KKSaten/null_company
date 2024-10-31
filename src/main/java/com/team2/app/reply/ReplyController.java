package com.team2.app.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.app.comment.CommentService;
import com.team2.app.comment.CommentVO;
import com.team2.app.employee.EmployeeVO;

import jakarta.validation.Valid;


@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private CommentService commentService;
	
	
	@GetMapping("write")
	public String writeReply(CommentVO commentVO, Model model) throws Exception{
		
		List<CommentVO> list = commentService.getCommentList(commentVO);
		
		model.addAttribute("targetNum2", commentVO.getCommentNum());
		model.addAttribute("list", list);
		
		return "comment/list";
	}
	
	
	@PostMapping("write")
	public String writeReply(@Valid ReplyVO replyVO, BindingResult bindingResult, Model model) throws Exception{
		
		if(bindingResult.hasErrors()) {
			int result = 0;
			
			model.addAttribute("result", result);
			
			return "commons/result";
		}
		
		SecurityContext context = SecurityContextHolder.getContext();	
		Authentication authentication = context.getAuthentication();
		EmployeeVO temp = (EmployeeVO)authentication.getPrincipal();
		
		replyVO.setEmpNum(temp.getEmpNum());
		
		int result = replyService.writeReply(replyVO);
		
		model.addAttribute("result", result);
		
		return "commons/result";
	}
	
	
	@GetMapping("modify")
	public String modifyReply(@AuthenticationPrincipal EmployeeVO employeeVO, CommentVO commentVO, ReplyVO replyVO, Model model) throws Exception{
		
		int empNum = replyService.getEmpNum(replyVO);
		
		if(employeeVO.getEmpNum() != empNum) {
			model.addAttribute("result", "작성자 본인만 수정이 가능합니다");
			model.addAttribute("url", "/notice/list");
			
			return "commons/message";
		}
		
		List<CommentVO> list = commentService.getCommentList(commentVO);
		
		model.addAttribute("targetNum3", replyVO.getReplyNum());
		model.addAttribute("list", list);
		
		return "comment/list";
	}
	
	@PostMapping("modify")
	public String modifyReply(@Valid ReplyVO replyVO, BindingResult bindingResult, Model model) throws Exception{
		
		if(bindingResult.hasErrors()) {
			int result = 0;
			
			model.addAttribute("result", result);
			
			return "commons/result";
		}
		
		int result = replyService.modifyReply(replyVO);
		
		model.addAttribute("result", result);
		
		return "commons/result";
	}
	
	
	@PostMapping("delete")
	public String deleteReply(ReplyVO replyVO, Model model) throws Exception{
	
		int result = replyService.deleteReply(replyVO);
		
		model.addAttribute("result", result);
		
		return "commons/result";
	}
	

}
