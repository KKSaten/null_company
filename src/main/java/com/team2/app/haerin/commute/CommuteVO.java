package com.team2.app.haerin.commute;

import java.sql.Date;

import com.team2.app.employee.EmployeeVO;

import lombok.Data;

@Data
public class CommuteVO {

	private Long commuteNum;
	private String empNum;
	private Date commuteInTime;
	private Date commuteOutTime;
	private Boolean commuteStatus;
	private String empName;

}
