package com.team2.app.positions;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.positions.PositionsVO;
import com.team2.app.employee.EmployeeVO;

@Mapper
public interface PositionsMapper {
	public List<PositionsVO> getList() throws Exception;

	public int add(PositionsVO positionsVO) throws Exception;

	public PositionsVO checkName(PositionsVO positionsVO) throws Exception;

	public PositionsVO detail(PositionsVO positionsVO) throws Exception;

	public int update(PositionsVO positionsVO) throws Exception;

	public List<EmployeeVO> check(PositionsVO positionsVO) throws Exception;

	public int delete(PositionsVO positionsVO) throws Exception;

}
