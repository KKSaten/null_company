package com.team2.app.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.department.DepartmentVO;
import com.team2.app.employee.EmployeeMapper;
import com.team2.app.employee.EmployeeVO;

@Mapper
public interface ChatMapper {
	
	public List<RoomVO> getList(EmployeeVO employeeVO) throws Exception;
	
	public int makeRoom (RoomVO roomVO) throws Exception;
	
	public int addMember (RoomVO roomVO) throws Exception;
	
	public RoomVO getRoomDetail (RoomVO roomVO) throws Exception;
	
	public List<ChatVO> getPreChat (RoomVO roomVO) throws Exception;
	
	public void chPreStatus (ChatVO chatVO) throws Exception;
	
	public List<RoomMemberVO> getRoomMember (RoomVO roomVO) throws Exception;
	
	public List<ChatVO> getChat (List<RoomMemberVO> roomMemberVOs) throws Exception;
	
	public Integer getReadCount (ChatVO chatVO) throws Exception;
	
	public void addChat (ChatVO chatVO) throws Exception;
	
	public void addRead (ChatVO chatVO) throws Exception;
	
	public void chReadStatus (ChatVO chatVO) throws Exception;

	public EmployeeVO getEmpDetail(EmployeeVO employeeVO) throws Exception;
	
	public RoomMemberVO getMemberDetail(RoomMemberVO roomMemberVO) throws Exception;
	
	public List<EmployeeVO> empList(DepartmentVO departmentVO) throws Exception;
}
