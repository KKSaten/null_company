package com.team2.app.chat;

import java.time.LocalDateTime;

import com.team2.app.employee.EmployeeVO;

import lombok.Data;

@Data
public class ChatVO {
    private Integer chatNum;
    private Integer roomNum;
    private Integer empNum;
    private String chatContents;
    private LocalDateTime createTime;  
    
}
