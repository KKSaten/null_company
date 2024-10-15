package com.team2.app.notification;

import com.team2.app.employee.EmployeeVO;

import lombok.Data;

@Data
public class NotificationVO {
	
	private String emitterId;
	private String notificationContent;
	private String url;
	private NotificationType notificationType;
	private EmployeeVO employeeVO;
}
