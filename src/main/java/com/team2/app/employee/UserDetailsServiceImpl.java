package com.team2.app.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
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
