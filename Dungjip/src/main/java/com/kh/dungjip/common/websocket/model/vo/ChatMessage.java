package com.kh.dungjip.common.websocket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChatMessage {

private String contentMessage;
private int chatRoomNo;
private int userNo;
private String sendMessageTime;
private String readMessage;
private String status;

public ChatMessage(String contentMessage, int userNo, String sendMessageTime) {
	super();
	this.contentMessage = contentMessage;
	this.userNo = userNo;
	this.sendMessageTime = sendMessageTime;
}
	
	
	
	
}
