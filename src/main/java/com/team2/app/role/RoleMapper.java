package com.team2.app.role;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.employee.EmployeeVO;
import com.team2.app.role.RoleVO;

@Mapper
public interface RoleMapper {
	public List<RoleVO> getList() throws Exception;

	public int add(RoleVO RoleVO) throws Exception;

	public RoleVO checkName(RoleVO RoleVO) throws Exception;

	public RoleVO detail(RoleVO RoleVO) throws Exception;

	public int update(RoleVO RoleVO) throws Exception;

	public List<EmployeeVO> check(RoleVO RoleVO) throws Exception;

	public int delete(RoleVO RoleVO) throws Exception;
}
