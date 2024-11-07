package com.team2.app.chat;

import java.sql.Timestamp;

import com.team2.app.employee.EmployeeVO;

import lombok.Data;

@Data
public class ChatVO {
    private Integer chatNum;
    private Integer memberNum;
    private String chatContents;
    private Timestamp createTime;
    private Integer readCount;
    private EmployeeVO employeeVO;
    
    
}
