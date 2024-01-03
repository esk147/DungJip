package com.kh.dungjip.common.report.model.service;

import java.util.List;

import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;

public interface ReportEstateService {

	List<ReportEstate> selectReportList();

	List<ChatMessage> selectChatHistory(int chatRoomNo);

	void increaseMemberCount(int chatRoomNo);

	void updateReportStatus(int chatRoomNo);

}
