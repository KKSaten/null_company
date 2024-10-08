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

import com.team2.app.role.RoleVO;
import com.team2.app.util.FileManager;
import com.team2.app.util.FileVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmployeeService implements UserDetailsService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${app.upload}")
	private String path;
	
	public List<EmployeeVO> getList() throws Exception {
		return employeeMapper.getList();
	}
	
	public EmployeeVO getDetail (EmployeeVO employeeVO) throws Exception {
		return employeeMapper.login(employeeVO);
	}
	
	public int delete(EmployeeVO employeeVO) throws Exception {
		return employeeMapper.delete(employeeVO);
	}
	
	public void update (EmployeeVO employeeVO, MultipartFile attach) throws Exception {
		
	}
	
	public void chpass (EmployeeVO employeeVO) throws Exception {
		//비밀번호 암호화
		String pwd = passwordEncoder.encode(employeeVO.getEmpPwd());
		employeeVO.setEmpPwd(pwd);
		
		employeeMapper.chpass(employeeVO);
	}
	
	//사원등록
	public int join (EmployeeVO employeeVO, RoleVO roleVO, MultipartFile attach) throws Exception {
		
		//비밀번호 암호화
		String pwd = passwordEncoder.encode(employeeVO.getEmpPwd());
		employeeVO.setEmpPwd(pwd);
		
		//role
		List<RoleVO> roleVOs = new ArrayList<RoleVO>();
		roleVOs.add(roleVO);
		employeeVO.setRoleVOs(roleVOs);
		
		//DB insert쿼리
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("employeeVO", employeeVO);		
		int result = employeeMapper.join(map);
		
		log.info("num : {}", map.get("num"));
		
		BigInteger num = new BigInteger(map.get("num").toString());
		
		employeeVO.setEmpNum(num.intValue());
		
		result = employeeMapper.addEmpRole(employeeVO);
		
		if(result==1) {
			
			//직원 사진 저장
			
			if(attach.isEmpty()) {
				
				
			}
			
			String fileName = fileManager.fileSave(path+"employee/", attach);
			
			EmployeeFileVO fileVO = new EmployeeFileVO();
			
			fileVO.setEmpNum(employeeVO.getEmpNum());
			fileVO.setOriName(attach.getOriginalFilename());
			fileVO.setFileName(fileName);
			
			employeeMapper.saveFile(fileVO);
			
		}
		
		return result;
	}

	//로그인
	@Override
	public UserDetails loadUserByUsername(String empId) throws UsernameNotFoundException {
		
		
		log.info("=================================================");
		log.info("id : {}", empId);

		EmployeeVO employeeVO = new EmployeeVO();

		employeeVO.setEmpId(empId);
		
		log.info("1. employeeVO : {}", employeeVO);
		
		try {
			employeeVO = employeeMapper.login(employeeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		log.info("2. employeeVO : {}", employeeVO);

		return employeeVO;
	}
}
