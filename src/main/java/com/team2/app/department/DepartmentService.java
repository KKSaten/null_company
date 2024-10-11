package com.team2.app.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	public List<DepartmentVO> getList () throws Exception {
		return departmentMapper.getList();
	}
	
	public int add(DepartmentVO departmentVO) throws Exception {
		
		DepartmentVO vo =  departmentMapper.checkName(departmentVO);
		
		if(vo == null) {
			return 0;
		}
		
		return departmentMapper.add(departmentVO);
	}
	
	public DepartmentVO detail(DepartmentVO departmentVO) throws Exception {
		return departmentMapper.detail(departmentVO);
	}
	
	public int update(DepartmentVO departmentVO) throws Exception {
		
DepartmentVO vo =  departmentMapper.checkName(departmentVO);
		
		if(vo == null) {
			return 0;
		}
		
		return departmentMapper.update(departmentVO);
	}

}
