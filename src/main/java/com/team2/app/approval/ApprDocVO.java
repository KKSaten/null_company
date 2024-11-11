package com.team2.app.approval;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ApprDocVO {
	
	private Long docNum;
	
	private Integer docWriter;
	private String empName;
	private String deptName;
	private String posName;
	private String fileName;
	
	private Integer docTypecode;
	private Long docTemplatecode;
	private String templateName;
	
	private String docTitle;
	private byte[] docContent;
	
	private Date docUpdatedate;
	private Date docDraftdate;
	private Date docExpirydate;
	
	private String approvalResult;
	
	private List<ApprLineVO> apprLineVO;
	private List<ApprHistoryVO> apprHistoryVO;
	
	
	private String tempStorage;
	
	private String contents="";
	
	
}
