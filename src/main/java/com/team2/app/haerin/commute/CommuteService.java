package com.team2.app.haerin.commute;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CommuteService {
	
		@Autowired
		private CommuteMapper commuteMapper;
	
		public List<CommuteVO> checkList( ) throws Exception {
			return commuteMapper.checkList();
		}
		 public void clockIn(String empNum) throws Exception {
		        CommuteVO commute = new CommuteVO();
		        commute.setEmpNum(empNum);
		        commute.setCommuteInTime(new Date(0)); // 현재 시간
		        commute.setCommuteStatus(true); // 출근 상태

		        commuteMapper.insertCommute(commute);
		    }

		    public void clockOut(String empNum) throws Exception {
		        CommuteVO commute = new CommuteVO();
		        commute.setEmpNum(empNum);
		        commute.setCommuteOutTime(new Date(0)); // 현재 시간
		        commute.setCommuteStatus(false); // 퇴근 상태

		        commuteMapper.updateCommute(commute);
		    }
}
