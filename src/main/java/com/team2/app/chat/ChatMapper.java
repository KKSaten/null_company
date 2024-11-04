package com.team2.app.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.department.DepartmentVO;
import com.team2.app.employee.EmployeeMapper;
import com.team2.app.employee.EmployeeVO;

@Mapper
public interface ChatMapper {
	
	public List<RoomVO> getList() throws Exception;
	
	public int makeRoom (RoomVO roomVO) throws Exception;
	
	public RoomVO getRoomDetail (RoomVO roomVO) throws Exception;
	
	public List<EmployeeVO> getRoomMember (RoomVO roomVO) throws Exception;
	
	public List<ChatVO> getChat (RoomVO roomVO) throws Exception;
	
	public Integer getReadCount (ChatVO chatVO) throws Exception;
	
	public void addChat (ChatVO chatVO) throws Exception;
	
	public void addRead (ChatVO chatVO) throws Exception;
	
	public void chReadStatus (ChatVO chatVO) throws Exception;
	
	public int addMember (RoomVO roomVO) throws Exception;

	public EmployeeVO getEmpDetail(EmployeeVO employeeVO) throws Exception;
	
	public List<EmployeeVO> empList(DepartmentVO departmentVO) throws Exception;
}
