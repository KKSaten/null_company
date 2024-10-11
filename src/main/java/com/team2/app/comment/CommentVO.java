package com.team2.app.comment;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {
	
	
	private Long commentNum;
	private Long noticeNum;
	private Integer empNum;
	private String commentContents;
	private Date commentDate;
	private boolean commentDel;

}
