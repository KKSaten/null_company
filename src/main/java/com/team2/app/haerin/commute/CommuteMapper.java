package com.team2.app.haerin.commute;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CommuteMapper {
	public List<CommuteVO> checkList()throws Exception;
	public void insertCommute(CommuteVO commute) throws Exception;
	public void updateCommute(CommuteVO commute) throws Exception;
}
