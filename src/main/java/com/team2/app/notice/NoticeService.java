package com.team2.app.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	
	
	public List<NoticeVO> getList() throws Exception{
		
		return noticeMapper.getList();
	}
	
	public NoticeVO getPost(NoticeVO noticeVO) throws Exception{
		
		return noticeMapper.getPost(noticeVO);
	}

}
