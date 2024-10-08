package com.team2.app.employee;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import com.team2.app.util.FileVO;

@Mapper
public interface EmployeeMapper {
	
	public List<EmployeeVO> getList() throws Exception;
	
	public int delete (EmployeeVO employeeVO) throws Exception;
	
	public EmployeeVO login(EmployeeVO employeeVO) throws Exception;
	
	public int join(Map<String,Object> map) throws Exception;
	
	public int addEmpRole(EmployeeVO employeeVO) throws Exception;

	public void chpass(EmployeeVO employeeVO) throws Exception;
	
	public void saveFile(EmployeeFileVO fileVO) throws Exception;
}
