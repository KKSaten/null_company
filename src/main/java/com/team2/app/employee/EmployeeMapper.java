package com.team2.app.employee;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeMapper {

	public EmployeeVO login(EmployeeVO employeeVO) throws Exception;

	public void chpass(EmployeeVO employeeVO) throws Exception;
}
