package com.team2.app.chat;

import java.sql.Date;

import lombok.Data;

@Data
public class RoomMemberVO {
	private Integer memberNum;
	private Integer roomNum;
	private Integer empNum;
	private Date addDate;
	
}
