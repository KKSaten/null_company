package com.team2.app.chat;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team2.app.employee.EmployeeVO;

import lombok.Data;

@Data
public class RoomVO {
	
	private Integer roomNum;
	private String roomName;
	private Date createTime;
	private List<RoomMemberVO> roomMember;
	private List<ChatVO> chatList;
	
}
