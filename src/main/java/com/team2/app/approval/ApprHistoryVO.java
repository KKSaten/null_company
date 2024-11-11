package com.team2.app.approval;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class ApprHistoryVO {
	
	private Long apprNum;
	
	private Long docNum;
	
	private Integer approver;
	
	private Integer apprLevel;
	
	private Timestamp apprDate;
	
	private String apprComment;
	
	private String apprResult;
	

}
