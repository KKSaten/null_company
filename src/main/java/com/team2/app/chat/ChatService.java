package com.team2.app.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.app.department.DepartmentVO;
import com.team2.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatService {

	@Autowired
	ChatMapper chatMapper;

	public List<RoomVO> getList() throws Exception {
		return chatMapper.getList();
	}

	public int makeRoom(RoomVO roomVO) throws Exception {
		int result = chatMapper.makeRoom(roomVO);

		if (result > 0) {
			result = chatMapper.addMember(roomVO);
		}

		log.info("makeRoom Service vo : {}", roomVO);

		return result;
	}

	public RoomVO getRoomDetail(RoomVO roomVO) throws Exception {

		// 채팅방 정보 불러오기
		roomVO = chatMapper.getRoomDetail(roomVO);

		// 채팅방 인원 불러오기
		roomVO.setRoomMember(chatMapper.getRoomMember(roomVO));
		
		List<ChatVO> list = chatMapper.getChat(roomVO);
		
		for(ChatVO chatVO: list) {
			
			chatVO.setReadCount(chatMapper.getReadCount(chatVO));
		}

		// 이전 채팅 불러오기
		roomVO.setChatList(list);

		return roomVO;
	}

	public void addChat(ChatVO chatVO) throws Exception {
		chatMapper.addChat(chatVO);

		// 채팅방 인원 불러오기
		RoomVO roomVO = new RoomVO();
		roomVO.setRoomNum(chatVO.getRoomNum());
		List<EmployeeVO> list = chatMapper.getRoomMember(roomVO);

		// 채팅방 인원 마다 읽음 여부 생성
		for (EmployeeVO employeeVO : list) {
			ChatVO vo = new ChatVO();
			vo.setChatNum(chatVO.getChatNum());
			vo.setRoomNum(chatVO.getRoomNum());
			vo.setEmpNum(employeeVO.getEmpNum());
			chatMapper.addRead(vo);
		}
		
		//나의 읽음상태 변경
		chatMapper.chReadStatus(chatVO);
		
		
	}

	public EmployeeVO getEmpDetail(EmployeeVO employeeVO) throws Exception {
		return chatMapper.getEmpDetail(employeeVO);
	}

	public List<EmployeeVO> empList(DepartmentVO departmentVO) throws Exception {
		return chatMapper.empList(departmentVO);
	}

}
