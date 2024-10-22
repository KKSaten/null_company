package com.team2.app.chat;

import lombok.Data;

@Data
public class ChatVO {
    private String sender;
    private String content;
    private MessageType type;

    public enum MessageType {
        CHAT,
        LEAVE
    }
}
