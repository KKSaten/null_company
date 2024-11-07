package com.team2.app.chat;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team2.app.employee.EmployeeVO;

import lombok.Data;

@Data
public class ChatVO {
    private Integer chatNum;
    private Integer memberNum;
    private String chatContents;
    
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private Timestamp createTime;
    private Integer readCount;
    private EmployeeVO employeeVO;
    
    public String getFormattedCreateTime() {
        if (createTime == null) {
            return null;
        }
        LocalDateTime localDateTime = createTime.toLocalDateTime();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd a h:mm:ss");
        return localDateTime.format(formatter);
    }
    
}
