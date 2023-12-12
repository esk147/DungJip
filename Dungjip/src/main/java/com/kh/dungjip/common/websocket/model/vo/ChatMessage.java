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
private String userNickname;
private String sendMessageTime;
private String readMessage;
private String status;
public ChatMessage(String contentMessage, int chatRoomNo, int userNo, String userNickname) {
	super();
	this.contentMessage = contentMessage;
	this.chatRoomNo = chatRoomNo;
	this.userNo = userNo;
	this.userNickname = userNickname;
}


	
	
	
}
