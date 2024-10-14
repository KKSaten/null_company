package com.team2.app.haerin.vacation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VacationMapper {
	public List<VacationVO> list()throws Exception;
	public List<VacationVO> listDetail()throws Exception;
}
