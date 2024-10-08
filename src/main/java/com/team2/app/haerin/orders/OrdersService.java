package com.team2.app.haerin.orders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersService {
	@Autowired
	private OrdersMapper ordersMapper;

	public void list() throws Exception {
		
	}

}
