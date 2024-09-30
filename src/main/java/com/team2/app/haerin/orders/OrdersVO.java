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
	private boolean orderSitudation;
}
