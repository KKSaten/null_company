package com.team2.app.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.app.employee.EmployeeVO;

@Service
public class ApprovalService {
	
	@Autowired
	private ApprovalMapper approvalMapper;
	
	public void approvalDraftbox() throws Exception {
		
	}
	
	
	public void approvalReceivedbox() throws Exception {
		
	}
	
	public List<ApprDocVO> getList(EmployeeVO empVO) throws Exception {
		return approvalMapper.getList(empVO);
	}
	
	public List<DocTypeVO> getDocType() throws Exception {
		return approvalMapper.getDocType();
	}
	
	
	
	
}
