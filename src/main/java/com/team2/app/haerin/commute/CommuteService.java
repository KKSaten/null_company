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
		public List<CommuteVO> userList(CommuteVO commuteVO) throws Exception {
			return commuteMapper.userList(commuteVO);
		}
		public int checkIn(CommuteVO commuteVO) throws Exception {
			return commuteMapper.checkIn(commuteVO); 
		}

		public int checkOut(CommuteVO commuteVO) throws Exception {
		    return commuteMapper.checkOut(commuteVO);
		}
		    
		public boolean canCheckIn(CommuteVO commuteVO) throws Exception {
		    return commuteMapper.checkTodayCheckIn(commuteVO) == 0;
		}

		public boolean canCheckOut(CommuteVO commuteVO) throws Exception {
			return commuteMapper.checkTodayCheckOut(commuteVO) == 1;
		}   
		
		public Object update(Integer empNum, Integer commuteStatus,String commuteMsg)throws Exception {
			return commuteMapper.update(empNum,commuteStatus,commuteMsg); 
			
		}
		
		public Object absent(CommuteVO commuteVO) throws Exception {
			return commuteMapper.absent(commuteVO);
		}
		public int absentUpdate(CommuteVO commuteVO) throws Exception {
			return commuteMapper.absentUpdate(commuteVO);
		}
		    
}
