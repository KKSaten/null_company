package com.team2.app.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
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
		String fileName = UUID.randomUUID().toString();
		
		if(attach.isEmpty()) {
			//사원 기본 이미지
			File profile = new File(path+"default/default_profile.png");
			fileName = fileName+"_default_profile.png";
			file = new File(file,fileName);
			FileCopyUtils.copy(profile, file);
		} else {
			fileName = fileName+"_"+attach.getOriginalFilename();
			file = new File(file,fileName);
			attach.transferTo(file);			
		}
		
		log.info("저장 경로: {}", file);
		log.info("저장할 파일명: {}", fileName);
		
		return fileName;
	}
	
	public void fileUpdate(String path, MultipartFile attach) throws Exception {
		
		File file = new File(path);
		
		attach.transferTo(file);
		
	}
	
}
