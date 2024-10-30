package com.team2.app.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyService {
	
	
	@Autowired
	private ReplyMapper replyMapper;
	
	
	public int writeReply(ReplyVO replyVO) throws Exception{
		
		return replyMapper.writeReply(replyVO);
	}
	
	public int modifyReply(ReplyVO replyVO) throws Exception{
		
		return replyMapper.modifyReply(replyVO);
	}
	
	public int deleteReply(ReplyVO replyVO) throws Exception{
		
		return replyMapper.deleteReply(replyVO);
	}
	
	public int getEmpNum(ReplyVO replyVO) throws Exception{
		
		return replyMapper.getEmpNum(replyVO);
	}
	

}
