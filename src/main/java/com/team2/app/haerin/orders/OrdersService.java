package com.team2.app.haerin.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.app.employee.EmployeeVO;

@Service
public class OrdersService {
	@Autowired
	private OrdersMapper ordersMapper;

	public List<OrdersVO> list() throws Exception {
		return ordersMapper.list();
	}
	public void userList() throws Exception {
			
		}
	
}
