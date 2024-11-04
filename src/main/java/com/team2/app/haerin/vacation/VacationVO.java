package com.team2.app.haerin.vacation;

import java.sql.Date;

import lombok.Data;

@Data
public class VacationVO {

	private Long vacationNum;
	private String vacationTotal;
	private String vacationLeftoverDate;
	private String empName;
	private Integer empNum;
	private String posName;
	 private String deptName; // 부서 이름 필드 추가
	 private VacationCountVO vacationCountVO;
	 private String date;
	 private Integer dating;
	 private Date createdDate;
}
