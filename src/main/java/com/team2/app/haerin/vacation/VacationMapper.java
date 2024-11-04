package com.team2.app.haerin.vacation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team2.app.haerin.commute.CommuteVO;

@Mapper
public interface VacationMapper {
	
	
	//사용자 휴가 리스트
	public List<VacationVO> myVacation(VacationVO vacationVO)throws Exception;
	public List<VacationVO> myListDetail(VacationVO vacationVO)throws Exception;

	
	public List<VacationVO> list()throws Exception;
	public List<VacationVO> listDetail()throws Exception;
	public void updateVacation(VacationVO vacationVO);

}
