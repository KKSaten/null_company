package com.team2.app.util;

import lombok.Data;

@Data
public class Pager {
	
	private Long page=1L;
	private Long perPage = 10L;
	private Long totalPage;
	
	private Long startRow;
	private Long startPage;
	private Long lastPage;
	
	private boolean next;
	
	public void makeRow() {
		this.startRow = (page-1) * perPage;
	}
	
	public void makeNum(long totalCount) {
		
		// 1. Row 의 수에 따라 '총 몇개의 페이지'가 나오는지 구하는 작업
		// 한 화면에 리스트를 10개씩 보여준다고 가정했을 때, Row 의 수가 30개면 3개의 페이지가 나온다
		if(totalCount % perPage == 0) {
			totalPage = totalCount / perPage;
		}else {
			totalPage = (totalCount / perPage)+1;
		}
		
		// 2. 총 페이지 수로 총 block 의 수를 구하는 작업
		// Block 은 한 화면에 보여지는 페이지의 수를 뜻함
		// 예시) << 1 2 3 4 5 >> 이것이 하나의 block
		long perBlock = 5L;
		long totalBlock = 0;
		
		if(totalPage % perBlock == 0) {
			totalBlock = totalPage / perBlock;
		}else {
			totalBlock = (totalPage / perBlock) + 1;
		}
		
		// 3. 현재 페이지 번호로 현재 블럭 번호 구하기
		// 예시) 현재 페이지가 11페이지일 경우, 현재 블럭은 3번째 블럭이 된다
		long curBlock = 0;
		
		if(page % perBlock == 0) {
			curBlock = page / perBlock;
		}else {
			curBlock = (page / perBlock) + 1;
		}
		
		// 4. 현재 블럭번호(curBlock)로 해당 블럭의 시작 페이지와 끝 페이지 값 구하기
		// 예시) 현재 블럭이 3번 블럭일 때, 시작 페이지는 11이 되고 끝 페이지는 15가 된다
		startPage = ((curBlock-1) * perBlock)+1;
		lastPage = curBlock * perBlock;
		
		// 5. 이전 블럭, 다음 블럭 유무 판단
		// next 가 true 면 다음 블럭이 존재, false 면 다음 블럭 없음
		next = true;
		
		if(curBlock == totalBlock) {
			next = false;
			
			lastPage = totalPage;
		}
	}

}
