
package com.kh.dungjip.common.websocket.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.common.websocket.model.dao.ChatDao;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;
import com.kh.dungjip.common.websocket.model.vo.JoinChat;
import com.kh.dungjip.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;

	@Autowired

	private SqlSessionTemplate sqlSession;

	@Override
	public Member clickIndividualEstate(int mno) {

		return chatDao.clickIndividualEstate(sqlSession,mno);
	}
	@Override
	public int alreadyUsedChatRoomCheck(JoinChat c) {//이미 두유저간 채팅방이 존재할때 막아주는 메소드
		
		
		return chatDao.alreadyUsedChatRoomCheck(sqlSession,c);
	}
	@Override
	public int createChatRoom(JoinChat createRoom) {

		return chatDao.createChatRoom(sqlSession,createRoom);
	}
	@Override
	public int nowCreateChatRoomMe(int loginUserNo) {

		return chatDao.nowCreateChatRoomMe(sqlSession,loginUserNo);
	}
	@Override
	public int joinNowCreateChatRoom(int estateUserNo) {
		// TODO Auto-generated method stub
		return chatDao.joinNowCreateChatRoom(sqlSession,estateUserNo);
	}
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
