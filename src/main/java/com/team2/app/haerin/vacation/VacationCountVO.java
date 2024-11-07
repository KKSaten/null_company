package com.team2.app.haerin.vacation;

import java.sql.Date;

import lombok.Data;
@Data
public class VacationCountVO {

	private Long vacationCountNum;
	private Date createdDate;
	private Date vacationStartDate;
	private Date vacationEndDate;
}
