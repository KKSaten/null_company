package com.team2.app.chat;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;
import com.team2.app.employee.EmployeeVO;

import lombok.Data;

@Data
public class ChatVO {
    private Integer chatNum;
    private Integer roomNum;
    private Integer empNum;
    private String chatContents;
    private Date createTime;  
    
}
