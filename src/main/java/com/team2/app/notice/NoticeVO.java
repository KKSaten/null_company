package com.team2.app.notice;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private Long noticeNum;
	private String empNum;
	private String noticeTitle;
	private String noticeContents;
	private Long noticeHit;
	private Date noticeDate;
}
