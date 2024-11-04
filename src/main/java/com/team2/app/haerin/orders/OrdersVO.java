package com.team2.app.haerin.orders;

import java.sql.Date;

import com.team2.app.department.DepartmentVO;
import com.team2.app.positions.PositionsVO;
import com.team2.app.role.RoleVO;

import lombok.Data;
@Data
public class OrdersVO {

	private String orderNum;
	private Integer empNum;
	private Date orderDate;
	
	private Long departmentNum;
	private String departmentName;

	private Long posNum;
	private String posName;
	
	private Long roleNum;
	private String roleName;

	private Date appointmentDate;
	private boolean orderSituation;
	private String empName;
	  
    private Long prevPosNum;      // 이전 직위
	private String prevPosName;

    private Long prevDepartmentNum;    // 이전 부서
	private String prevDepartmentName;

    private Long prevRoleNum;     
	private String prevRoleName;
     
}
