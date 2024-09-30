package com.team2.app.haerin.vacation;

import java.sql.Date;

import lombok.Data;
@Data
public class VacationCountVO {

	private Long vacationNum;
	private Date vacationStartDate;
	private Date vacationEndDate;
}
