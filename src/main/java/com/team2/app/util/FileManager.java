package com.team2.app.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileManager {
	
	//파일 저장
	public String fileSave (String path, MultipartFile attach) throws Exception {
		
		//저장 경로
		File file = new File(path);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//저장할 파일명 생성
		String fileName = UUID.randomUUID().toString()+"_"+attach.getOriginalFilename();
		
		//저장 경로 + 파일명
		file = new File(file,fileName);
		
		attach.transferTo(file);
		
		log.info("저장 경로: {}", file);
		log.info("저장할 파일명: {}", fileName);
		
		return fileName;
	}
}
