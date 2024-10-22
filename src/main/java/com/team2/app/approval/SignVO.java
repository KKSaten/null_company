package com.team2.app.approval;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SignVO {
	
	private Long signNum;
	private Integer signUser;
	
	private String signTitle;
	private String signImage;
	private String signRepresent;
	private Timestamp signDate;
	
	
}
