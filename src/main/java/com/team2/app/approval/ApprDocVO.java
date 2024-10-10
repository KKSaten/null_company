package com.team2.app.approval;

import java.sql.Blob;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ApprDocVO {
	
	private Long docNum;
	
	private Integer docWriter;
	
	private Integer docTypecode;
	private Long docTemplatecode;
	private String docTypename;
	
	private String docTitle;
	private Blob docContent;
	
	private Timestamp docUpdatedate;
	private Timestamp docDraftdate;
	private Timestamp docExpirydate;
	
	
	private ApprLineVO apprLineVO;
	private ApprHistoryVO apprHistoryVO;
	
	
	private String tempStorage;
	
	
}
