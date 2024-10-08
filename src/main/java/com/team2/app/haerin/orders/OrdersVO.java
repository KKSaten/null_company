package com.team2.app.haerin.orders;

import java.sql.Date;



import lombok.Data;
@Data
public class OrdersVO {

	private String orderNum;
	private String empNum;
	private Date orderDate;
	private Long departmentNum;
	private Long posNum;
	private Date appointmentDate;
	private boolean orderSituation;
	private String empName;
	
	
	  
	    private String previousPosition;      // 이전 직위
	    private String newPosition;           // 발령 직위
	    private String previousDepartment;    // 이전 부서
	    private String newDepartment;         // 발령 부서
}
