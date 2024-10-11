package com.team2.app.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

	
	@Autowired
	private CommentMapper commentMapper;
	
	
	public List<CommentVO> getCommentList(CommentVO commentVO) throws Exception{
		
		return commentMapper.getCommentList(commentVO);
	}
	
	public int writeComment(CommentVO commentVO) throws Exception{
		
		return commentMapper.writeComment(commentVO);
	}
}