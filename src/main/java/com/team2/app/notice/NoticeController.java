package com.team2.app.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	
	@GetMapping("list")
	public void getList(Model model) throws Exception{
		
		List<NoticeVO> list = noticeService.getList();
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("post")
	public void getPost(Model model, NoticeVO noticeVO) throws Exception{
		
		noticeVO = noticeService.getPost(noticeVO);
		
		model.addAttribute("noticeVO", noticeVO);
	}
}
