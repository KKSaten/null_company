package com.team2.app.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	
	
	int writeReply(ReplyVO replyVO) throws Exception;
	
	int modifyReply(ReplyVO replyVO) throws Exception;
	
	int deleteReply(ReplyVO replyVO) throws Exception;
	

}
