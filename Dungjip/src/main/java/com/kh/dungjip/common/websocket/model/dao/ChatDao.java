package com.kh.dungjip.common.websocket.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dungjip.common.websocket.model.vo.ChatMessage;

public class ChatDao {

	public int insertMsg(SqlSessionTemplate sqlSession, ArrayList<ChatMessage> cm) {
	
		
		return sqlSession.insert("chat.mapper", cm);

	
	}

}
