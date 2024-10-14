package com.team2.app.reply;

import lombok.Data;

@Data
public class ReplyVO {
	
	
	private Long replyNum;
	private Long commentNum;
	private Integer empNum;
	private String replyContents;
	private String replyDate;
	private boolean replyDel;

}
