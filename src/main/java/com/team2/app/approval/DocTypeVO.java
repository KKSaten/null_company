package com.team2.app.approval;

import java.util.List;

import lombok.Data;

@Data
public class DocTypeVO {
	
	private Integer docTypecode;
	private String docTypename;
	
	private List<DocTemplateVO> docTemplateVO;
	
}
