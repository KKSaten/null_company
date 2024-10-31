package com.team2.app.schedule;

import com.team2.app.employee.EmployeeVO;

import lombok.Data;

@Data
public class ScheduleVO {

	private Long scheduleNum;
	private Integer empNum;
	private String scheduleTitle;
	private String scheduleContents;
	private String scheduleStart;
	private String scheduleEnd;
	private String scheduleCategory;
	private boolean schedulePrivate;
	
	// 캘린더 화면에 작성자 이름을 보여주기 위해 JOIN을 함
	private EmployeeVO employeeVO;
	
}
