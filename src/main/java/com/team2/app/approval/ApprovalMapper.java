package com.team2.app.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.employee.EmployeeFileVO;
import com.team2.app.employee.EmployeeVO;

@Mapper
public interface ApprovalMapper {
	
	public List<ApprDocVO> getList(EmployeeVO empVO) throws Exception;
	
	public List<DocTypeVO> getDocType() throws Exception;
	
	public List<SignVO> signList(EmployeeVO empVO) throws Exception;
	
	public int saveSign(SignVO signVO) throws Exception;
	
	public int setSignNull(SignVO signVO) throws Exception;
	public int setDefaultSign(SignVO signVO) throws Exception;
	
	public SignVO getDefaultSign(SignVO signVO) throws Exception;
	
	public int deleteSign(SignVO signVO) throws Exception;
	
}
