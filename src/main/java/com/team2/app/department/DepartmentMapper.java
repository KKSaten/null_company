package com.team2.app.department;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DepartmentMapper {
	
	public List<DepartmentVO> getList () throws Exception;
	
	public int add (DepartmentVO departmentVO) throws Exception;
	
	public DepartmentVO checkName (DepartmentVO departmentVO) throws Exception;
	
	public DepartmentVO detail (DepartmentVO departmentVO) throws Exception;
	
	public int update (DepartmentVO departmentVO) throws Exception;

}
