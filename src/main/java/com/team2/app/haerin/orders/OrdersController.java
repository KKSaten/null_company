package com.team2.app.haerin.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.app.employee.EmployeeVO;



@Controller
@RequestMapping("/orders/*")
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	
	@GetMapping("list")
	public void list(Model model) throws Exception{
		List<OrdersVO> ordersVO = ordersService.list();
		model.addAttribute("list",ordersVO);
		
	}
	@GetMapping("userList")
	public void userList() throws Exception{
		
	}
	
}
