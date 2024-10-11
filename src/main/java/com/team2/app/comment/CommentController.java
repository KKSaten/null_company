package com.team2.app.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	
	@Autowired
	private CommentService commentService;
	
	
	@GetMapping("list")
	public void getCommentList(CommentVO CommentVO, Model model) throws Exception{
		
		List<CommentVO> list = commentService.getCommentList(CommentVO);
		
		model.addAttribute("list", list);
	}
	
	
	public void writeComment(CommentVO commentVO) throws Exception{
		
		int result = commentService.writeComment(commentVO);
		
	}

}
