package com.team2.app.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.team2.app.employee.EmployeeVO;

@Service
public class ApprovalService {
	
	@Autowired
	private ApprovalMapper approvalMapper;
	
	@Autowired
	private SignManager signManager;
	
	//경로 설정
	@Value("${app.upload}")
	private String path;
	
	
	public List<ApprDocVO> getReceivedList(EmployeeVO empVO) throws Exception {
		return approvalMapper.getReceivedList(empVO);
	}
	
	public List<ApprDocVO> getList(EmployeeVO empVO) throws Exception {
		return approvalMapper.getList(empVO);
	}
	
	public ApprDocVO getDetail(ApprDocVO apprDocVO) throws Exception {
		return approvalMapper.getDetail(apprDocVO);
	}
	
	
	public List<DocTypeVO> getDocType() throws Exception {
		return approvalMapper.getDocType();
	}
	
	public List<SignVO> signList(EmployeeVO empVO) throws Exception {
		return approvalMapper.signList(empVO);
	}
	
	public int saveSign(SignVO signVO) throws Exception {
		
		String fileName = signManager.fileSave(path + "signature/", signVO);
		
		signVO.setSignImage(fileName);
		
		int result = approvalMapper.saveSign(signVO);
		
		
		return result;
	}
	
	public int setDefaultSign(SignVO signVO) throws Exception {
		
		int result = 0;
		result += approvalMapper.setSignNull(signVO);
		result += approvalMapper.setDefaultSign(signVO);
		
		return result;
	}
	
	public SignVO getDefaultSign(SignVO signVO) throws Exception {
		
		signVO = approvalMapper.getDefaultSign(signVO);
		
		return signVO;
		
	}
	
	public int deleteSign(SignVO signVO) throws Exception {
		
		int result = approvalMapper.deleteSign(signVO);
		
		return result;
	}
	
	public int draftDoc(ApprDocVO apprDocVO) throws Exception {
		
		int result = approvalMapper.draftDoc(apprDocVO);
		
		return result;
	}
	
	public int saveApprLine(ApprLineVO apprLineVO) throws Exception {
		
		int result = approvalMapper.saveApprLine(apprLineVO);
		
		return result;
		
	}
	
	public int aprlStart(ApprLineVO apprLineVO) throws Exception {
		
		int result = approvalMapper.aprlStart(apprLineVO);
		
		return result;
	}
	
	
}
