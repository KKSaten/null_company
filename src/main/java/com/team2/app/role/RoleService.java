package com.team2.app.role;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.app.employee.EmployeeVO;
import com.team2.app.role.RoleVO;

@Service
public class RoleService {
	
	@Autowired
	RoleMapper roleMapper;

	public List<RoleVO> getList () throws Exception {
		return roleMapper.getList();
	}
	
	public int add(RoleVO roleVO) throws Exception {
		
		RoleVO vo =  roleMapper.checkName(roleVO);
		
		if(vo == null) {
			return 0;
		}
		
		return roleMapper.add(roleVO);
	}
	
	public RoleVO detail(RoleVO roleVO) throws Exception {
		return roleMapper.detail(roleVO);
	}
	
	public int update(RoleVO roleVO) throws Exception {
		
		RoleVO vo =  roleMapper.checkName(roleVO);
		
		
		if(vo != null) {
			return 0;
		}
		
		
		return roleMapper.update(roleVO);
	}
	
	public int delete(RoleVO roleVO) throws Exception {
		
		List<EmployeeVO> list = roleMapper.check(roleVO);
		
		if(list.size()>0) {
			return 0;
		}
		
		return roleMapper.delete(roleVO);
	}
}
