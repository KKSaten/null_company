package com.team2.app.approval;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SignManager {
	
	//파일 저장
	public String fileSave (String path, SignVO signVO) throws Exception {
		
		//저장 경로
		File file = new File(path);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//저장할 파일명 생성
		String fileName = UUID.randomUUID().toString();
		
		fileName = signVO.getSignTitle() + "_" + fileName;
		file = new File(file, fileName);
		signVO.getSignatureImage().transferTo(file);			
		
		log.info("저장 경로: {}", file);
		log.info("저장할 파일명: {}", fileName);
		
		return fileName;
	}
	
	public void fileUpdate(String path, SignVO signVO) throws Exception {
		
		File file = new File(path);
		
		signVO.getSignatureImage().transferTo(file);
		
	}
	
}
