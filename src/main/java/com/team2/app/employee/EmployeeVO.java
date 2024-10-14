package com.team2.app.employee;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.team2.app.department.DepartmentVO;
import com.team2.app.positions.PositionsVO;
import com.team2.app.role.RoleVO;
import com.team2.app.util.FileVO;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class EmployeeVO implements UserDetails {

	private Integer empNum;
	private String empId;
	private String empName;
	private String empPwd;
	private String empPwdCheck;
	private String empRegistry;
	private String empGender;
	private String empAddress;
	private Long deptNum;
	private Long roleNum;
	private Long posNum;
	private Date hiredate;
	private Date outdate;
	private boolean enabled;
	private EmployeeFileVO employeeFileVO;
	private RoleVO roleVO;
	private DepartmentVO deptVO;
	private PositionsVO posVO;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authority = new ArrayList<>();

		GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("ROLE_"+roleVO.getRoleName());

		log.info("권한 : {}", grantedAuthority);

		authority.add(grantedAuthority);

		log.info("=================================================");

		return authority;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return empPwd;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return empId;
	}

}
