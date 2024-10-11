package com.team2.app.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/department/*")
@Controller
@Slf4j
public class DepartmentController {
	
	@Autowired
	DepartmentService departmentService;
	
	@GetMapping("list")
	public void getList (Model model) throws Exception {
		List<DepartmentVO> list = departmentService.getList();
		model.addAttribute("list", list);
		log.info("부서 목록 조회");
	}
	
	@GetMapping("add")
	public String add () throws Exception {
		return "department/edit";
	}
	
	@PostMapping("add")
	public String add (DepartmentVO departmentVO) throws Exception {
		int result = departmentService.add(departmentVO);
		
		if(result > 0) {
			return "redirect:/department/list";
		} else {
			return "edit";
		}
	}
	
	@GetMapping("update")
	public String update (DepartmentVO departmentVO, Model model) throws Exception {
		
		departmentVO = departmentService.detail(departmentVO);
		
		model.addAttribute("vo", departmentVO);
		
		return "department/edit";
	}
	
	@PostMapping("update")
	public void update (DepartmentVO departmentVO) throws Exception {
		departmentService.update(departmentVO);
	}
	
}
