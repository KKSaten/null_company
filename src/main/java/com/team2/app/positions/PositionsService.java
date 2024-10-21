package com.team2.app.positions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PositionsService {
	
	@Autowired
	PositionsMapper positionsMapper;

	public List<PositionsVO> getList () throws Exception {
		return positionsMapper.getList();
	}
	
	public int add(PositionsVO positionsVO) throws Exception {
		
		PositionsVO vo =  positionsMapper.checkName(positionsVO);
		
		if(vo == null) {
			return 0;
		}
		
		return positionsMapper.add(positionsVO);
	}
	
	public PositionsVO detail(PositionsVO positionsVO) throws Exception {
		return positionsMapper.detail(positionsVO);
	}
	
	public int update(PositionsVO positionsVO) throws Exception {
		
		PositionsVO vo =  positionsMapper.checkName(positionsVO);
		
		
		if(vo != null) {
			return 0;
		}
		
		
		return positionsMapper.update(positionsVO);
	}
	
	public int delete(PositionsVO positionsVO) throws Exception {
		
		List<EmployeeVO> list = positionsMapper.check(positionsVO);
		
		if(list.size()>0) {
			return 0;
		}
		
		return positionsMapper.delete(positionsVO);
	}
}
