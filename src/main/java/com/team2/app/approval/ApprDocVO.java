package com.team2.app.approval;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ApprDocVO {
	
	private Long docNum;
	
	private Integer docWriter;
	private String deptName;
	private String posName;
	private String fileName;
	
	private Integer docTypecode;
	private Long docTemplatecode;
	private String templateName;
	
	private String docTitle;
	private byte[] docContent;
	
	private Timestamp docUpdatedate;
	private Timestamp docDraftdate;
	private Timestamp docExpirydate;
	
	
	private ApprLineVO apprLineVO;
	private ApprHistoryVO apprHistoryVO;
	
	
	private String tempStorage;
	
	
}
