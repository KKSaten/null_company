package com.team2.app.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.team2.app.employee.EmployeeFileVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileDown extends AbstractView {
	
	@Value("${app.upload}")
	private String path;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		log.info("fileDownView");
		
		EmployeeFileVO employeeFileVO = (EmployeeFileVO) model.get("file");
		
		File file = new File (path+"employee/",employeeFileVO.getFileName());
		
		response.setCharacterEncoding("UTF-8");
		
		response.setContentLengthLong(file.length());
		
		String oriName = URLEncoder.encode(employeeFileVO.getOriName(), "UTF-8");
		
		response.setHeader("Content-Disposition", "attachment;fileName=\"" + oriName + "\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		FileInputStream fi = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(fi, os);
		
		os.close();
		fi.close();
		
	}
	
}
