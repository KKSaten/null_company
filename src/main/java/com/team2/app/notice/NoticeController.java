package com.team2.app.notice;

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

import com.team2.app.util.Pager;


@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	
	@GetMapping("list")
	public void getList(Model model, Pager pager) throws Exception{
		
		List<NoticeVO> list = noticeService.getList(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
	}
	
	@GetMapping("post")
	public void getPost(Model model, NoticeVO noticeVO) throws Exception{
		
		noticeVO = noticeService.getPost(noticeVO);
		
		model.addAttribute("noticeVO", noticeVO);
	}
	
	@GetMapping("write")
	public void writePost() throws Exception{}
	
	@PostMapping("write")
	public String writePost(NoticeVO noticeVO) throws Exception{
		
		// 로그인한 사용자 아이디를 꺼내는 작업
		SecurityContext context = SecurityContextHolder.getContext();
		
		Authentication authentication = context.getAuthentication();
		
		noticeVO.setEmpNum(authentication.getName());
		
		int result = noticeService.writePost(noticeVO);
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("modify")
	public void modifyPost(NoticeVO noticeVO, Model model) throws Exception{
		
		// 수정 페이지에서 기존에 작성한 글을 보여주기 위한 코드
		// 1. post.jsp에서 수정하기 버튼 클릭시 해당 글의 noticeNum을 보냄
		// 2. 받아온 noticeNum으로 getPost메서드를 호출하여 해당 게시글 정보를 가져옴
		// 3. 조회한 게시글 정보를 modify.jsp에 보냄으로서 기존에 작성한 글을 보여줄 수 있음
		noticeVO = noticeService.getPost(noticeVO);
		
		model.addAttribute("noticeVO", noticeVO);
	}
	
	@PostMapping("modify")
	public String modifyPost(NoticeVO noticeVO) throws Exception{
		
		int result = noticeService.modifyPost(noticeVO);
		
		return "redirect:/notice/post?noticeNum=" + noticeVO.getNoticeNum();	
	}
}
