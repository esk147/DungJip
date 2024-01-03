package com.kh.dungjip.common.report.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;

@Repository
public class ReportEstateDao {

	public List<ReportEstate> selectReportList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("chatMapper.selectReportList");
	}

    public List<ChatMessage> selectChatHistory(SqlSessionTemplate sqlSession, int chatRoomNo) {
        return sqlSession.selectList("chatMapper.selectChatHistory", chatRoomNo);
    }

	public void increaseMemberCount(SqlSessionTemplate sqlSession, int chatRoomNo) {
		// TODO Auto-generated method stub
		sqlSession.update("chatMapper.increaseMemberCount", chatRoomNo);
	}

	public void updateReportStatus(SqlSessionTemplate sqlSession, int chatRoomNo) {
		// TODO Auto-generated method stub
		sqlSession.update("chatMapper.updateReportStatus", chatRoomNo);
	}


}
