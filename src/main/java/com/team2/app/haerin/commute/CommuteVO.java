package com.team2.app.haerin.commute;

import java.sql.Date;

import lombok.Data;

@Data
public class CommuteVO {

	private Long commuteNum;
	private String empNum;
	private Date commuteTime;
	private Boolean commuteStatus;
}