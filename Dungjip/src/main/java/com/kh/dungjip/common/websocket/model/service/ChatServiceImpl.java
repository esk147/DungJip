
package com.kh.dungjip.common.websocket.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.common.websocket.model.dao.ChatDao;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;

	@Autowired

	private SqlSessionTemplate sqlSession;

	@Override//
	public ArrayList<ChatRoom> chatRoomList(int userNo) {//사용장의 현재 채팅방 리스트를 뽑아오는 메소드
		
		return chatDao.chatRoomList(sqlSession,userNo);
	}
	@Override
	public ArrayList<ChatMessage> selectChatMsg(int cno) {//기존 채팅방의 메세지 받아오는 메소드
		
		
		return  chatDao.selectChatMsg(sqlSession,cno);
	}
	@Override
	public int updateChatRoomMsg(ChatMessage c) {

		
		return chatDao.updateChatRoomMsg(sqlSession, c);
	}

	

}
