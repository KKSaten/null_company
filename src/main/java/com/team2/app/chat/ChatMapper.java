package com.team2.app.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.department.DepartmentVO;
import com.team2.app.employee.EmployeeMapper;
import com.team2.app.employee.EmployeeVO;

@Mapper
public interface ChatMapper {
	
	public List<RoomVO> getList() throws Exception;
	
	public List<EmployeeVO> empList(DepartmentVO departmentVO) throws Exception;

}
