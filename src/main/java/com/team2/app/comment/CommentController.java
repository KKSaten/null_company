package com.team2.app.comment;

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

import com.team2.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/comment/*")
@Slf4j
public class CommentController {
	
	
	@Autowired
	private CommentService commentService;
	
	
	@GetMapping("list")
	public void getCommentList(CommentVO CommentVO, Model model) throws Exception{
		
		List<CommentVO> list = commentService.getCommentList(CommentVO);
		
		model.addAttribute("list", list);
	}
	
	@PostMapping("write")
	public String writeComment(CommentVO commentVO, Model model) throws Exception{
		
		SecurityContext context = SecurityContextHolder.getContext();	
		Authentication authentication = context.getAuthentication();
		EmployeeVO temp = (EmployeeVO)authentication.getPrincipal();
		
		commentVO.setEmpNum(temp.getEmpNum());
		
		int result = commentService.writeComment(commentVO);
		
		model.addAttribute("result", result);
		
		return "commons/result";	
	}
	
	@PostMapping("delete")
	public String deleteComment(CommentVO commentVO, Model model) throws Exception{
		
		int result = commentService.deleteComment(commentVO);
		
		model.addAttribute("result", result);
		
		return "commons/result";
	}

}
