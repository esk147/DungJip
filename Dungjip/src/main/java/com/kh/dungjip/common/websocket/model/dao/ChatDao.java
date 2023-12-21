package com.kh.dungjip.common.websocket.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;
import com.kh.dungjip.common.websocket.model.vo.JoinChat;
import com.kh.dungjip.member.model.vo.Member;
@Repository
public class ChatDao {

	public Member clickIndividualEstate(SqlSessionTemplate sqlSession, int mno) {

		return (Member)sqlSession.selectOne("chatMapper.clickIndividualEstate", mno);
	}

	public ArrayList<ChatRoom> chatRoomList(SqlSessionTemplate sqlSession, int userNo) {//채팅방 리스트
		ArrayList<ChatRoom> chatRooms = (ArrayList)sqlSession.selectList("chatMapper.chatRoomList", userNo);


		  for (ChatRoom chatRoom : chatRooms) {
		        if (chatRoom.getMembers() != null) {
		            for (Member member : chatRoom.getMembers()) {
		                // Calculate the active status using the isActive method
		                boolean activeStatus = member.isActive();
		                String timeAgo = member.calculateTimeAgo();
		                // Set the active field of the Member object
		                member.setActive(activeStatus);
		            }
		        }
		    }
		 return chatRooms;
	}

	public ArrayList<ChatMessage> selectChatMsg(SqlSessionTemplate sqlSession, int cno) {//이전 대화 불러오는 기능


		return (ArrayList)sqlSession.selectList("chatMapper.selectChatMsg",cno);
		
		
	}


	public int updateChatRoomMsg(SqlSessionTemplate sqlSession, ChatMessage c) {//해당채팅방 대화내용 저장 

		return sqlSession.insert("chatMapper.updateChatRoomMsg",c);
	}

	public int createChatRoom(SqlSessionTemplate sqlSession, JoinChat createRoom) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chatMapper.createChatRoom", createRoom);
	}
	public int nowCreateChatRoomMe(SqlSessionTemplate sqlSession, int loginUserNo) {

		return sqlSession.insert("chatMapper.nowCreateChatRoomMe",loginUserNo);
	}
	public int joinNowCreateChatRoom(SqlSessionTemplate sqlSession, int estateUserNo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chatMapper.joinNowCreateChatRoom",estateUserNo);
	}
	public int alreadyUsedChatRoomCheck(SqlSessionTemplate sqlSession, JoinChat c) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.alreadyUsedChatRoomCheck", c);
	}












}
