package com.team2.app.positions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@RequestMapping("/positions/*")
@Controller
@Slf4j
public class PositionsController {
	
	@Autowired
	PositionsService positionsService;
	
	@GetMapping("list")
	public void getList (Model model) throws Exception {
		List<PositionsVO> list = positionsService.getList();
		model.addAttribute("list", list);
		log.info("부서 목록 조회");
	}
	
	@GetMapping("add")
	public String add () throws Exception {
		return "positions/edit";
	}
	
	@PostMapping("add")
	public String add (PositionsVO positionsVO) throws Exception {
		int result = positionsService.add(positionsVO);
		
		if(result > 0) {
			return "redirect:/positions/list";
		} else {
			return "edit";
		}
	}
	
	@GetMapping("update")
	public String update (PositionsVO positionsVO, Model model) throws Exception {
		
		positionsVO = positionsService.detail(positionsVO);
		
		model.addAttribute("vo", positionsVO);
		
		return "positions/edit";
	}
	
	@PostMapping("update")
	public String update (PositionsVO positionsVO) throws Exception {
		
		
		int result = positionsService.update(positionsVO);
		
		log.info("직책 수정 {}", result);
		
		if(result==1) {
			return "redirect:/positions/list";
		} else {
			return "positions/edit";
		}
	}
	
	@GetMapping("delete")
	public void delete (PositionsVO positionsVO) throws Exception {
		
		int result = positionsService.delete(positionsVO);
		
	}
}
