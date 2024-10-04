package com.team2.app.haerin.commute;

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
	
}
