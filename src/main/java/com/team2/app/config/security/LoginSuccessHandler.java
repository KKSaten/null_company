package com.team2.app.config.security;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.team2.app.employee.EmployeeVO;
import com.team2.app.notification.NotificationService;
import com.team2.app.notification.NotificationType;
import com.team2.app.notification.NotificationVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	NotificationService notificationService;
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.info("로그인 성공");
		
		EmployeeVO employeeVO = (EmployeeVO)authentication.getPrincipal();
		
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setNotificationType(NotificationType.LOGIN);
		notificationVO.setEmployeeVO(employeeVO);
		notificationVO.setNotificationContent(employeeVO.getEmpId()+"님이 로그인했습니다.");
		
		try {
			notificationService.sendAll(notificationVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/");
		
	}
	
}
