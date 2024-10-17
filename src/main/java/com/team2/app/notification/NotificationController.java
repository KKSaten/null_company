package com.team2.app.notification;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.HeadersBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.web.header.Header;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.team2.app.employee.EmployeeService;
import com.team2.app.employee.EmployeeVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/notification/*")
@Slf4j
public class NotificationController {

	@Autowired
	private NotificationService notificationService;

	// Last-Event-ID는 SSE 연결이 끊어졌을 경우, 클라이언트가 수신한 마지막 데이터의 id 값을 의미합니다. 항상 존재하는 것이
	// 아니기 때문에 false
	@GetMapping(value = "connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public ResponseEntity<SseEmitter> subscribe(HttpSession session,
			@RequestHeader(value = "Last-Event-ID", required = false, defaultValue = "") String lastEventId)
			throws Exception {

		SecurityContextImpl securityContextImpl = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");

		SecurityContext sc = SecurityContextHolder.getContext();

		Authentication ac = sc.getAuthentication();

		log.info("ac: {}", ac);

		if (ac.getPrincipal() != "anonymousUser") {

			EmployeeVO employeeVO = (EmployeeVO) ac.getPrincipal();

			log.info("Notification Controller ===============");
			log.info("lastEventId : {}", lastEventId);

			return ResponseEntity.ok(notificationService.subscribe(employeeVO, lastEventId));
		} else {
			return ResponseEntity.ok(new SseEmitter());
		}
	}

}
