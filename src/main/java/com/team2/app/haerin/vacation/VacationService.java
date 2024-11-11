package com.team2.app.haerin.vacation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.app.haerin.commute.CommuteVO;

@Service
public class VacationService {
	@Autowired 
	private VacationMapper vacationMapper;
	
	public List<VacationVO> myVacation(VacationVO vacationVO) throws Exception {
		 return vacationMapper.myVacation(vacationVO);
	}
	public List<VacationVO>  myListDetail(VacationVO vacationVO)throws Exception{
		return vacationMapper.myListDetail(vacationVO	);
	}
	
	public List<VacationVO> list()throws Exception{
		return vacationMapper.list();
		}
	public List<VacationVO>  listDetail()throws Exception{
		return vacationMapper.listDetail();
	}
	public void updateVacation(VacationVO vacationVO) {
        vacationMapper.updateVacation(vacationVO);
    }
	public void vacationAdd(VacationVO vacationVO)throws Exception{
		vacationMapper.vacationAdd(vacationVO);
	}
	public void update(VacationVO vacationVO)throws Exception{
		vacationMapper.update(vacationVO);
	}
}
