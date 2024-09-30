package com.team2.app.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {

	List<NoticeVO> getList() throws Exception;
	
	NoticeVO getPost(NoticeVO noticeVO) throws Exception;
}
