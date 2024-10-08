package com.team2.app.approval;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class ApprLineVO {
	
	private Long docNum;
	
	private Long docTemplatecode;

	private Integer approver;
	
	private Long apprRole;
	
	private Long apprDept;
	

}
