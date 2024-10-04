package com.team2.app.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.extern.slf4j.Slf4j;

@Configuration
@Slf4j
public class FileConfig implements WebMvcConfigurer {

	@Value("${app.url.path}")
	private String url;
	
	@Value("${app.upload.base}")
	private String file;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		log.info("==========================================");
		log.info("파일 요청 URL: {}", url);
		log.info("파일 저장 경로: {}", file);
		
		registry.addResourceHandler(url)
				.addResourceLocations(file);
	}
}
