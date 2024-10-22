package com.team2.app.employee;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.Spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.team2.app.department.DepartmentVO;
import com.team2.app.positions.PositionsVO;
import com.team2.app.role.RoleVO;
import com.team2.app.util.FileManager;
import com.team2.app.util.FileVO;
import com.team2.app.util.Pager;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${app.upload}")
	private String path;
	
	public List<EmployeeVO> getList(Pager pager) throws Exception {
		
		pager.makeRow();
		
		Long total = employeeMapper.getTotal();
		
		pager.makeNum(total);
		
		return employeeMapper.getList(pager);
	}
	
	public List<RoleVO> getRole (EmployeeVO employeeVO) throws Exception {
		return employeeMapper.getRole(employeeVO);
	}
	
	public List<DepartmentVO> getDept (EmployeeVO employeeVO) throws Exception {
		return employeeMapper.getDept(employeeVO);
	}
	
	public List<PositionsVO> getPos (EmployeeVO employeeVO) throws Exception {
		return employeeMapper.getPos(employeeVO);
	}
	
	public int delete(EmployeeVO employeeVO) throws Exception {
		return employeeMapper.delete(employeeVO);
	}
	
	public EmployeeVO detail(EmployeeVO employeeVO) throws Exception {
		return employeeMapper.login(employeeVO);
	}
	
	public int update (EmployeeVO employeeVO, MultipartFile attach) throws Exception {
		
		int result = 0;
		
		if(attach != null) {
			
			EmployeeFileVO employeeFileVO = employeeVO.getEmployeeFileVO();
			
			employeeFileVO.setOriName(attach.getOriginalFilename());
			
			String updatePath = path+"employee/"+employeeFileVO.getFileName();
			
			log.info("이미지 수정 경로: {}", updatePath);
			
			fileManager.fileUpdate(updatePath, attach);
			
			result = employeeMapper.fileUpdate(employeeFileVO);
		} else {
			result = employeeMapper.addrUpdate(employeeVO);
		}
		
		
		return result;
	}
	
	public void chpass (EmployeeVO employeeVO) throws Exception {
		//비밀번호 암호화
		String pwd = passwordEncoder.encode(employeeVO.getEmpPwd());
		employeeVO.setEmpPwd(pwd);
		
		employeeMapper.chpass(employeeVO);
	}
	
	//사원등록
	public int join (EmployeeVO employeeVO, MultipartFile attach) throws Exception {
		
		//비밀번호 암호화
		String pwd = passwordEncoder.encode(employeeVO.getEmpPwd());
		employeeVO.setEmpPwd(pwd);
		
		//DB insert쿼리
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("employeeVO", employeeVO);		
		int result = employeeMapper.join(map);
		
		log.info("num : {}", map.get("num"));
		
		BigInteger num = new BigInteger(map.get("num").toString());
		
		employeeVO.setEmpNum(num.intValue());
		
		if(result==1) {
			
			//직원 사진 저장
			
			String fileName = fileManager.fileSave(path+"employee/", attach);
			EmployeeFileVO fileVO = new EmployeeFileVO();
			
			fileVO.setEmpNum(employeeVO.getEmpNum());
			fileVO.setOriName(attach.getOriginalFilename());
			fileVO.setFileName(fileName);
			
			employeeMapper.saveFile(fileVO);
			
		}
		
		return result;
	}

	
	
	public List<EmployeeVO> empList() throws Exception {
		return employeeMapper.empList();
	}
	
	public int empListUpdate(EmployeeVO employeeVO)throws Exception{
		return employeeMapper.empListUpdate(employeeVO);
		
	}
	public int empListInsert(EmployeeVO employeeVO)throws Exception{
		return employeeMapper.empListInsert(employeeVO);
		
	}
}
