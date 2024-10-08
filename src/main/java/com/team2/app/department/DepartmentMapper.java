package com.team2.app.department;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DepartmentMapper {
	
	public List<DepartmentVO> getList () throws Exception;

}
