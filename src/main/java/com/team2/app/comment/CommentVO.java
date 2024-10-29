package com.team2.app.comment;

import java.util.List;

import com.team2.app.department.DepartmentVO;
import com.team2.app.employee.EmployeeVO;
import com.team2.app.reply.ReplyVO;

import lombok.Data;

@Data
public class CommentVO {
	
	
	private Long commentNum;
	private Long noticeNum;
	private Integer empNum;
	private String commentContents;
	private String commentDate;
	private boolean commentDel;
	
	// 댓글에서 작성자 이름과 부서명을 보여주기 위해 JOIN
	private EmployeeVO employeeVO;
	private DepartmentVO departmentVO;
	
	// 답글 목록을 가져오기 위해 JOIN
	private List<ReplyVO> replyList;

}
