package com.team2.app.haerin.commute;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CommuteMapper {
	//관리자 근태 리스트
	public List<CommuteVO> checkList()throws Exception;
	//사용자 근태 리스트
	public List<CommuteVO> userList(CommuteVO commuteVO)throws Exception;
	//출근
	public int checkIn(CommuteVO commuteVO) throws Exception;
	//퇴근
	public int checkOut(CommuteVO commuteVO) throws Exception;
	//
	public int checkTodayCheckIn(CommuteVO commuteVO) throws Exception;
	//
	public int checkTodayCheckOut(CommuteVO commuteVO)throws Exception;
	//관리자 근태 관리 수정
	public int update(Integer empNum, Integer commuteStatus)throws Exception;
	
	public Object absent(CommuteVO commuteVO)throws Exception;
	
	public int absentUpdate(CommuteVO commuteVO)throws Exception;

	
}
