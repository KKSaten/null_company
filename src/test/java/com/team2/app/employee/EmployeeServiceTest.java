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
//		for(int i=0; i <= 50; i++) {
//			noticeVO.setEmpNum(2);
//			noticeVO.setNoticeTitle(i+"회차 주요 변경사항 안내");
//			noticeVO.setNoticeContents("참고 바랍니다.");
//			
//			int result = noticeMapper.writePost(noticeVO);
//		}
//	}

}
