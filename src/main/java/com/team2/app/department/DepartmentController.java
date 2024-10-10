package com.team2.app.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/department/*")
@Controller
public class DepartmentController {
	
	@Autowired
	DepartmentService departmentService;
	
	@GetMapping("list")
	public void getList (Model model) throws Exception {
		List<DepartmentVO> list = departmentService.getList();
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("add")
	public void add () throws Exception {
		
	}
	
	@PostMapping("add")
	public void add (DepartmentVO departmentVO) throws Exception {
		
	}
	
}
