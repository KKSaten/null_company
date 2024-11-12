package com.team2.app.exceptions;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/exceptions/*")
@Controller
public class ExceptionsController {

	@GetMapping("403")
	public void accessDeniedHandler () throws Exception {
		
	}
}
