package com.team2.app.schedule;

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
	
}
