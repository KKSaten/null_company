package com.team2.app.haerin.orders;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.app.employee.EmployeeVO;

@Mapper
public interface OrdersMapper {
	public List<OrdersVO> list()throws Exception;
	
}
