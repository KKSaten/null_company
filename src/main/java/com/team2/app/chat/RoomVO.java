package com.team2.app.chat;

import java.time.LocalDateTime;
import java.util.List;

import com.team2.app.employee.EmployeeVO;

import lombok.Data;

@Data
public class RoomVO {
	
	private Integer RoomNum;
	private String RoomName;
	private LocalDateTime createTime;
	private List<EmployeeVO> empList;
	private List<ChatVO> chatList;
	
}
