package com.team2.app.haerin.vacation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface VacationMapper {
	public List<VacationVO> list()throws Exception;
	public List<VacationVO> listDetail()throws Exception;
	public void updateVacation(@Param("empNum") String empNum, @Param("vacationLeftoverDate") String vacationLeftoverDate);

}
