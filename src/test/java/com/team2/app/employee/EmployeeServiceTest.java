package com.team2.app.employee;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.team2.app.notice.NoticeMapper;
import com.team2.app.notice.NoticeVO;

@SpringBootTest
class EmployeeServiceTest {
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	NoticeMapper noticeMapper;

//	@Test
//	void addNotice() throws Exception{
//		
//		NoticeVO noticeVO = new NoticeVO();
//		
//		for(int i=100; i <= 155; i++) {
//			noticeVO.setEmpNum("123123");
//			noticeVO.setNoticeTitle("제목" + i);
//			noticeVO.setNoticeContents("정보처리기사 실기까지 앞으로 2주!!");
//			
//			int result = noticeMapper.writePost(noticeVO);
//		}
//	}

}
