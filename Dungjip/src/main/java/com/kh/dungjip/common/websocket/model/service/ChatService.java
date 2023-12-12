
package com.kh.dungjip.common.websocket.model.service;

import java.util.ArrayList;

import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;

public interface ChatService {
	ArrayList<ChatRoom> chatRoomList(int userNo);//채팅방 리스트

	ArrayList<ChatMessage> selectChatMsg(int cno);//해당 채팅방 대화내용 불러옴

	int updateChatRoomMsg(ChatMessage c);



}
