package com.team2.app.haerin.orders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orders/*")
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	
	@GetMapping("list")
	public void list() throws Exception{
		
	}

}
