package com.team2.app.haerin.commute;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CommuteMapper {
	public List<CommuteVO> checkList()throws Exception;
	public int checkIn(CommuteVO commuteVO) throws Exception;
	public int checkOut(CommuteVO commuteVO) throws Exception;
	public int checkTodayCheckIn(CommuteVO commuteVO);
	public int checkTodayCheckOut(CommuteVO commuteVO);
}
