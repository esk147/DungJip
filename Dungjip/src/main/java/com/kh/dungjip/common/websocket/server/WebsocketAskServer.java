package com.kh.dungjip.common.websocket.server;

import java.io.IOException;
import java.net.URI;
import java.net.URLDecoder;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.dungjip.common.websocket.model.service.ChatService;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebsocketAskServer extends TextWebSocketHandler {

	@Autowired
	private ChatService chatService;

	private Map<Integer, Set<WebSocketSession>> roomSessions = new ConcurrentHashMap<>();// 채팅방,사용자의 세션 id

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		URI uri = session.getUri();// 파라미터로 보내준 uri 해체작업
		if (uri != null) {
			String query = uri.getQuery();
			Map<String, String> queryParams = parseQuery(query);

			String chatRoomNoStr = queryParams.get("chatRoomNo");
			if (chatRoomNoStr != null) {
				int chatRoomNo = Integer.parseInt(chatRoomNoStr);

				roomSessions.computeIfAbsent(chatRoomNo, k -> new CopyOnWriteArraySet<>()).add(session);// 만들어놓은 맵에 추가
				System.out.println("세션에 추가된 방번호 " + chatRoomNo);
			}
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 텍스트 보내는 메소드
		// Current time
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-ddEEEE HH:mm:ss");
		String formattedDateTime = now.format(formatter);
		String date = formattedDateTime.substring(5, 10) + "(" + formattedDateTime.substring(10, 11) + ")"
				+ formattedDateTime.substring(13);

		int userNo = ((Member) (session.getAttributes().get("loginUser"))).getUserNo();
		String userName = ((Member) (session.getAttributes().get("loginUser"))).getUserName();

		String text = message.getPayload();
		// System.out.println(text);

		// 받아온 거 해체작업
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = (JSONObject) parser.parse(text);

		String preCno = (String) jsonObj.get("cno");
		int chatRoomNo = Integer.parseInt(preCno);
		String contentMessage = (String) jsonObj.get("message");

		ChatMessage c = new ChatMessage(contentMessage, chatRoomNo, userNo, userName);

		int result = chatService.updateChatRoomMsg(c); // 메세지 전송

		JSONObject jobj = new JSONObject();// 메세지 사용자에게 보내기

		jobj.put("userName", userName);
		jobj.put("text", contentMessage);
		jobj.put("date", date);
		jobj.put("userNo", userNo);
		jobj.put("chatRoomNo", chatRoomNo);

		String jobjString = jobj.toString();
		TextMessage jobjMessage = new TextMessage(jobjString);

		System.out.println("메세지를 보낸 방번호 " + chatRoomNo);
		Set<WebSocketSession> sessionsInRoom = roomSessions.get(chatRoomNo);
		if (sessionsInRoom != null) {
			for (WebSocketSession s : sessionsInRoom) {
				s.sendMessage(jobjMessage);
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

	}

	private Map<String, String> parseQuery(String query) { // 파라미터로 받아온 방번호 해체 작업
		Map<String, String> queryPairs = new LinkedHashMap<>();
		String[] pairs = query.split("&");
		for (String pair : pairs) {
			int idx = pair.indexOf("=");
			queryPairs.put(URLDecoder.decode(pair.substring(0, idx), StandardCharsets.UTF_8),
					URLDecoder.decode(pair.substring(idx + 1), StandardCharsets.UTF_8));
		}
		return queryPairs;
	}

}
