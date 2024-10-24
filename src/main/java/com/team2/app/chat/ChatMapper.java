package com.team2.app.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatMapper {
	
	public List<RoomVO> getList() throws Exception;

}
