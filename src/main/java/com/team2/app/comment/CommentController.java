package com.team2.app.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.app.employee.EmployeeService;
import com.team2.app.employee.EmployeeVO;
import com.team2.app.notice.NoticeMapper;
import com.team2.app.notice.NoticeVO;
import com.team2.app.notification.NotificationService;
import com.team2.app.notification.NotificationType;
import com.team2.app.notification.NotificationVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/comment/*")
@Slf4j
public class CommentController {
	
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private EmployeeService employeeService;
	
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
		
		//댓글 알림
		//댓글로 게시글 detail 조회
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setNoticeNum(commentVO.getNoticeNum());
		noticeVO = noticeMapper.getPost(noticeVO);
		
		//게시글 작성자 조회
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEmpNum(noticeVO.getEmpNum());
		employeeVO = employeeService.detail(employeeVO);
		log.info("notice emp vo: {}", employeeVO);
		
		//게시글 작성자에게 알림VO 생성
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setEmployeeVO(employeeVO);
		notificationVO.setNotificationType(NotificationType.COMMENT);
		notificationVO.setNotificationContent(temp.getEmpId()+" 님이 게시글에 댓글을 달았습니다.");
		notificationVO.setUrl("/notice/post?noticeNum="+commentVO.getNoticeNum());
		
		notificationService.send(notificationVO);
		
		return "commons/result";	
	}
	
	@PostMapping("delete")
	public String deleteComment(CommentVO commentVO, Model model) throws Exception{
		
		int result = commentService.deleteComment(commentVO);
		
		model.addAttribute("result", result);
		
		return "commons/result";
	}
	
	
	@GetMapping("modify")
	public String modifyComment(@AuthenticationPrincipal EmployeeVO employeeVO, CommentVO commentVO, Model model) throws Exception{
		
		int empNum = commentService.getEmpNum(commentVO);
		
		if(employeeVO.getEmpNum() != empNum) {
			
			model.addAttribute("result", "수정은 작성자 본인만 가능합니다");
			model.addAttribute("url", "/notice/post?noticeNum="+commentVO.getNoticeNum());
			
			return "commons/message";
		}
		
		// 1. getList 메서드를 재활용하여 댓글 목록을 가져온다
		// 2. '수정'버튼을 클릭한 댓글의 commentNum을 AJAX 를 통해 받아온 다음, target 이라는 이름으로 model 에 담는다
		/*
		 * 3. JSP에 댓글 리스트를 보여줄 때, target 과 commentNum이 일치하는 댓글(=수정 버튼을 누른 댓글)은 댓글 내용 대신
		 * 댓글 입력창을 보여준다
		 */
		List<CommentVO> list = commentService.getCommentList(commentVO);
		
		model.addAttribute("targetNum", commentVO.getCommentNum());
		model.addAttribute("list", list);
		
		return "comment/list";
	}
	
	
	@PostMapping("modify")
	public String modifyComment2(CommentVO commentVO, Model model) throws Exception{
		
		int result = commentService.modifyComment(commentVO);
		
		model.addAttribute("result", result);
		
		return "commons/result";
	}

}
