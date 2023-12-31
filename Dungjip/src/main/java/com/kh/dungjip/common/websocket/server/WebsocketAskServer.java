package com.kh.dungjip.common.websocket.server;

import java.io.IOException;
import java.net.URI;
import java.net.URLDecoder;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.stream.Collectors;

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
	private ChatService chatService;//서비스(채팅과 관련된 데이터베이스 작업용

	
	private List<String> badWords;// 메시지 필터링에 적합하지 않은 단어 목록입니다.
	
	public WebsocketAskServer() {//파일에서 부적절한 단어 목록을 읽어 badWords에 저장합니다.
		
		try {

			badWords = Files.lines(Paths.get("C:\\Users\\82103\\git\\DungJip\\Dungjip\\src\\main\\resources\\badWords\\BadWordsList.txt")).collect(Collectors.toList());//txt파일을 읽어들여 list에 담는다.

		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private Map<Integer, Set<WebSocketSession>> roomSessions = new ConcurrentHashMap<>();//채팅방 ID를 WebSocket 세션 세트와 연결하는 맵

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
	
			}
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 텍스트 보내는 메소드
	System.out.println(message);
		// Current time
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-ddEEEE HH:mm:ss");
		String formattedDateTime = now.format(formatter);
		String date = formattedDateTime.substring(5, 10) + "(" + formattedDateTime.substring(10, 11) + ")"
				+ formattedDateTime.substring(13);

		int userNo = ((Member) (session.getAttributes().get("loginUser"))).getUserNo();
		String userName = ((Member) (session.getAttributes().get("loginUser"))).getUserName();

		String text = message.getPayload();		// 받아온 거 해체작업
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = (JSONObject) parser.parse(text);

		String preCno = (String) jsonObj.get("cno");
		int chatRoomNo = Integer.parseInt(preCno);
		String contentMessage = (String) jsonObj.get("message");
		ChatMessage c = new ChatMessage(contentMessage, chatRoomNo, userNo, userName);
		System.out.println(c);
		int result = chatService.updateChatRoomMsg(c); // 메세지 전송
		//관리자가 잘 알아볼수있게 미리 사용자의 대화를 db에 저장을 해두고 
		// 이후에 욕설필터링을 통하여 관리하기
		System.out.println("저장 됬나? :" +result);
		for(String word : badWords) {//위에서 받아온 badWords에서 반복문으로 사용자가 보낸 메세지가 담겨있는지 확인
			if(contentMessage.contains(word)) {
				
					contentMessage="부적절한 메시지가 담겨있습니다";
						
					//return;
			}
		}
		JSONObject jobj = new JSONObject();// 메세지 사용자에게 보내기

		jobj.put("userName", userName);
		jobj.put("text", contentMessage);
		jobj.put("date", date);
		jobj.put("userNo", userNo);
		jobj.put("chatRoomNo", chatRoomNo);

		String jobjString = jobj.toString();
		TextMessage jobjMessage = new TextMessage(jobjString);
		
		System.out.println(jobjMessage);

		System.out.println("메세지를 보낸 방번호 " + chatRoomNo);
		Set<WebSocketSession> sessionsInRoom = roomSessions.get(chatRoomNo);
		if (sessionsInRoom != null) {
			for (WebSocketSession s : sessionsInRoom) {
				s.sendMessage(jobjMessage);
			}
		}
	}
	/*
	 * @Override protected void handleBinaryMessage(WebSocketSession session,
	 * BinaryMessage message) { System.out.println("왔냐??"); ByteBuffer byteBuffer =
	 * message.getPayload(); // 바이너리 데이터 추출 및 처리 System.out.println(byteBuffer); //
	 * 예: 파일로 저장, 변환 등
	 * 
	 * URI uri = session.getUri(); if (uri != null) { String query = uri.getQuery();
	 * Map<String, String> queryParams = parseQuery(query);
	 * 
	 * String chatRoomNoStr = queryParams.get("chatRoomNo"); if (chatRoomNoStr !=
	 * null) { int chatRoomNo = Integer.parseInt(chatRoomNoStr); // 바이너리 데이터를 해당
	 * 채팅방의 다른 참가자들에게 전송 Set<WebSocketSession> sessionsInRoom =
	 * roomSessions.get(chatRoomNo); if (sessionsInRoom != null) {
	 * System.out.println("히히2"); for (WebSocketSession s : sessionsInRoom) { if
	 * (s.equals(session)) { // 메시지를 보낸 사용자 제외 try { System.out.println("히히3");
	 * s.sendMessage(new BinaryMessage(byteBuffer)); } catch (IOException e) { //
	 * TODO Auto-generated catch block e.printStackTrace(); } // 바이너리 메시지 전송 } } } }
	 * } }
	 */
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		for (Map.Entry<Integer, Set<WebSocketSession>> entry : roomSessions.entrySet()) {
	        Set<WebSocketSession> sessions = entry.getValue();
	        if (sessions.contains(session)) {
	            sessions.remove(session);
	     
	            if (sessions.isEmpty()) {
	                roomSessions.remove(entry.getKey());
	            }
	            break; 
	        }
	    }
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
