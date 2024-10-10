package com.team2.app.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {

	
	List<CommentVO> getCommentList(CommentVO commentVO) throws Exception;
	
	int writeComment(CommentVO commentVO) throws Exception;
}
