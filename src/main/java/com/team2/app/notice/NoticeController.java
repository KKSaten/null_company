package com.team2.app.notice;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.team2.app.employee.EmployeeVO;
import com.team2.app.util.Pager;


@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Value("${app.upload}")
	private String path;

	
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
		
		EmployeeVO temp = (EmployeeVO)authentication.getPrincipal();
		
		noticeVO.setEmpNum(temp.getEmpNum());
		
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
	
	// summerNote 이미지 업로드 코드
	@PostMapping(value="uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "D:\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
}
