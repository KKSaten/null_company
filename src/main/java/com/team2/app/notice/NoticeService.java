package com.team2.app.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.app.util.Pager;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	
	
	public List<NoticeVO> getList(Pager pager) throws Exception{
		
		// 페이지가 1보다 작아질 경우 강제로 페이지값을 1로 만드는 작업
		if(pager.getPage().equals(null) || pager.getPage() <= 1) {
			pager.setPage(1L);
		}
		
		pager.makeRow();
		
		long totalCount = noticeMapper.getTotalCount();
		
		pager.makeNum(totalCount);
		
		return noticeMapper.getList(pager);
	}
	
	public NoticeVO getPost(NoticeVO noticeVO) throws Exception{
		
		return noticeMapper.getPost(noticeVO);
	}
	
	public int writePost(NoticeVO noticeVO) throws Exception{
		
		return noticeMapper.writePost(noticeVO);
	}
	
	public int modifyPost(NoticeVO noticeVO) throws Exception{
		
		return noticeMapper.modifyPost(noticeVO);
	}

}
