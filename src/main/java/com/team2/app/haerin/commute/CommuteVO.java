package com.team2.app.haerin.commute;



import java.time.LocalDateTime;


import lombok.Data;

@Data
public class CommuteVO {

	private Long commuteNum;
	private Integer empNum;
	private LocalDateTime commuteInTime;
	private LocalDateTime commuteOutTime;
	private Integer commuteStatus;
	private String empName;
	private String commuteMsg;
	//포멧된 출근 시간 
	private String formattedCommuteInTime;
	//포멧된 퇴근 시간 
	private String formattedCommuteOutTime;

}
