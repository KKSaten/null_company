package com.team2.app.role;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.app.role.RoleVO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/role/*")
@Controller
@Slf4j
public class RoleController {
	
	@Autowired
	RoleService roleService;
	
	@GetMapping("list")
	public void getList (Model model) throws Exception {
		List<RoleVO> list = roleService.getList();
		model.addAttribute("list", list);
		log.info("부서 목록 조회");
	}
	
	@GetMapping("add")
	public String add () throws Exception {
		return "role/edit";
	}
	
	@PostMapping("add")
	public String add (RoleVO roleVO) throws Exception {
		int result = roleService.add(roleVO);
		
		if(result > 0) {
			return "redirect:/role/list";
		} else {
			return "edit";
		}
	}
	
	@GetMapping("update")
	public String update (RoleVO roleVO, Model model) throws Exception {
		
		roleVO = roleService.detail(roleVO);
		
		model.addAttribute("vo", roleVO);
		
		return "role/edit";
	}
	
	@PostMapping("update")
	public String update (RoleVO roleVO) throws Exception {
		
		
		int result = roleService.update(roleVO);
		
		log.info("직책 수정 {}", result);
		
		if(result==1) {
			return "redirect:/role/list";
		} else {
			return "role/edit";
		}
	}
	
	@GetMapping("delete")
	public void delete (RoleVO roleVO) throws Exception {
		
		int result = roleService.delete(roleVO);
		
	}
	
}
