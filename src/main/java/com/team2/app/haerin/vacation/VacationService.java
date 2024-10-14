package com.team2.app.haerin.vacation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VacationService {
	@Autowired 
	private VacationMapper vacationMapper;
	
	public void myVacation()throws Exception{
		
	}
	public List<VacationVO> list()throws Exception{
		return vacationMapper.list();
		}
	public List<VacationVO>  listDetail()throws Exception{
		return vacationMapper.listDetail();
	}
}
