package com.team2.app.employee;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.util.FileVO;

@Mapper
public interface EmployeeMapper {

	public EmployeeVO login(EmployeeVO employeeVO) throws Exception;
	
	public int join(EmployeeVO employeeVO) throws Exception;
	
	public int addEmpRole(EmployeeVO employeeVO) throws Exception;

	public void chpass(EmployeeVO employeeVO) throws Exception;
	
	public void saveFile(EmployeeFileVO fileVO) throws Exception;
}
