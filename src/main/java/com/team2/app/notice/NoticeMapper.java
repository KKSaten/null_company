package com.team2.app.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.util.Pager;

@Mapper
public interface NoticeMapper {

	List<NoticeVO> getList(Pager pager) throws Exception;
		
	long getTotalCount() throws Exception;
	
	NoticeVO getPost(NoticeVO noticeVO) throws Exception;
	
	int writePost(NoticeVO noticeVO) throws Exception;
	
	int modifyPost(NoticeVO noticeVO) throws Exception;
}
