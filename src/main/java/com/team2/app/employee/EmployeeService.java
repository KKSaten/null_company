package com.team2.app.employee;

import javax.swing.Spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmployeeService implements UserDetailsService {

	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	//사원등록
	public int join (EmployeeVO employeeVO) throws Exception {
		
		//비밀번호 암호화
		String pwd = passwordEncoder.encode(employeeVO.getEmpPwd());
		employeeVO.setEmpPwd(pwd);
		
		//DB insert쿼리
		int result = employeeMapper.join(employeeVO);
		
		return result;
	}

	//로그인
	@Override
	public UserDetails loadUserByUsername(String empNum) throws UsernameNotFoundException {
		
		
		log.info("=================================================");
		log.info("id : {}", empNum);

		EmployeeVO employeeVO = new EmployeeVO();

		employeeVO.setEmpNum(empNum);
		
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
