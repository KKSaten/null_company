package com.team2.app.notice;

import java.util.List;

import com.team2.app.department.DepartmentVO;
import com.team2.app.employee.EmployeeVO;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class NoticeVO {

	private Long noticeNum;
	private Integer empNum;
	@NotBlank
	private String noticeTitle;
	@NotBlank
	private String noticeContents;
	private Long noticeHit;
	private String noticeDate;
	
	// List의 변수명을 files로 사용하려고 했는데, 어째서인지 에러가 난다.
	// summernote 에디터에서 쓰는 이미지 첨부가 files라는 이름을 쓰고 있기 때문에 에러가 난다고 함
	private List<NoticeFileVO> list;
	
	// 게시판에서 부서명을 보여주기 위해 JOIN을 했다
	private EmployeeVO employeeVO;
	private DepartmentVO departmentVO;
}
