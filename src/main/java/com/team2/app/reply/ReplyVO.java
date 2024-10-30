package com.team2.app.reply;

import com.team2.app.department.DepartmentVO;
import com.team2.app.employee.EmployeeVO;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class ReplyVO {
	
	
	private Long replyNum;
	private Long commentNum;
	private Integer empNum;
	@NotBlank
	private String replyContents;
	private String replyDate;
	private boolean replyDel;
	
	// 답글 작성자 이름과 부서명을 표시하기 위해 JOIN함
	private EmployeeVO employeeVO;
	private DepartmentVO departmentVO;

}
