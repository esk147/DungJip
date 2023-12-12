package com.kh.dungjip.common.websocket.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;
@Repository
public class ChatDao {

	public ArrayList<ChatRoom> chatRoomList(SqlSessionTemplate sqlSession, int userNo) {//채팅방 리스트
		

		return (ArrayList)sqlSession.selectList("chatMapper.chatRoomList", userNo);
	}

	public ArrayList<ChatMessage> selectChatMsg(SqlSessionTemplate sqlSession, int cno) {//이전 대화 불러오는 기능

		return (ArrayList)sqlSession.selectList("chatMapper.selectChatMsg",cno);
	}


	public int updateChatRoomMsg(SqlSessionTemplate sqlSession, ChatMessage c) {//해당채팅방 대화내용 저장 

		return sqlSession.insert("chatMapper.updateChatRoomMsg",c);
	}








}
