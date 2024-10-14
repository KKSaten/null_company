package com.team2.app.haerin.vacation;

import java.sql.Date;

import lombok.Data;

@Data
public class VacationVO {

	private Long vacationNum;
	private Date vacationStartDate;
	private Date vacationEndDate;
	
	private String empName;
	private String empNum;
	private String posName;
	private String date;
	private Integer dating;
	 private String deptName; // 부서 이름 필드 추가
}
