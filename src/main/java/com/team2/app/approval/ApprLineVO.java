package com.team2.app.approval;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class ApprLineVO {
	
	private Long alNum;
	
	private Long docNum;
	
	private Long docTemplatecode;

	private Integer approver;
	
	private String apprProgress;
	
	private Integer apprTurn;
	
	private String approverName;
	

}
