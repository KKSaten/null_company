package com.team2.app.positions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PositionsService {
	
	@Autowired
	PositionsMapper positionsMapper;

}
