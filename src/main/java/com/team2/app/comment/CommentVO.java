package com.team2.app.comment;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	
	
	private Long commentNum;
	private Long noticeNum;
	private Integer empNum;
	private String commentContents;
	private String commentDate;
	private boolean commentDel;

}
