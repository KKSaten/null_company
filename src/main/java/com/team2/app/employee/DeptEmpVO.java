package com.team2.app.employee;

import java.util.List;

import lombok.Data;

@Data
public class DeptEmpVO {
	
	private Long deptNum;
	private String deptName;
	
	private List<EmployeeVO> employeeVO;

}
 