package com.team2.app.notice;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {

	private Long noticeNum;
	private Integer empNum;
	private String noticeTitle;
	private String noticeContents;
	private Long noticeHit;
	private String noticeDate;
	
	// List의 변수명을 files로 사용하려고 했는데, 어째서인지 에러가 난다.
	// summernote 에디터에서 쓰는 이미지 첨부가 files라는 이름을 쓰고 있기 때문에 에러가 난다고 함
	private List<NoticeFileVO> list;
}
