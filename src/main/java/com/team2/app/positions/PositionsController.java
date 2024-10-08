package com.team2.app.positions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PositionsController {
	
	@Autowired
	PositionsService positionsService;
	
}
