package com.team2.app.employee;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import com.team2.app.department.DepartmentVO;
import com.team2.app.positions.PositionsVO;
import com.team2.app.role.RoleVO;
import com.team2.app.util.FileVO;

@Mapper
public interface EmployeeMapper {
	
	public List<EmployeeVO> getList() throws Exception;
	
	public int delete (EmployeeVO employeeVO) throws Exception;
	
	public EmployeeVO login(EmployeeVO employeeVO) throws Exception;
	
	public int join(Map<String,Object> map) throws Exception;

	public void chpass(EmployeeVO employeeVO) throws Exception;
	
	public void saveFile(EmployeeFileVO fileVO) throws Exception;
	
	public int fileUpdate(EmployeeFileVO fileVO) throws Exception;
	
	public int addrUpdate(EmployeeVO employeeVO) throws Exception;
	
	public List<EmployeeVO> empList()throws Exception;
	
	public List<RoleVO> getRole (EmployeeVO employeeVO) throws Exception;
	
	public List<DepartmentVO> getDept (EmployeeVO employeeVO) throws Exception;
	
	public List<PositionsVO> getPos (EmployeeVO employeeVO) throws Exception;
	
	public int empListUpdate(EmployeeVO employeeVO)throws Exception;
	public int empListInsert(EmployeeVO employeeVO)throws Exception;

}
