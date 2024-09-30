package com.team2.app.employee;

import java.sql.Date;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class EmployeeVO implements UserDetails {
	private String empNum;
	private String empName;
	private String empPwd;
	private String empRegistry;
	private String empGender;
	private String empAddress;
	private Long deptNum;
	private Long posNum;
	private Date hiredate;
	private Date outdate;
	private boolean enabled;
	private List<RoleVO> roleVOs;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
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
		return empNum;
	}
	
	
}
