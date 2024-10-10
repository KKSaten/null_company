package com.team2.app.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.employee.EmployeeVO;

@Mapper
public interface ApprovalMapper {
	
	public List<ApprDocVO> getList(EmployeeVO empVO) throws Exception;
	
	public ApprLineVO getApprLine(ApprDocVO apprVO) throws Exception;
	
	public ApprHistoryVO getApprHistory(ApprDocVO apprVO) throws Exception;
	
}
