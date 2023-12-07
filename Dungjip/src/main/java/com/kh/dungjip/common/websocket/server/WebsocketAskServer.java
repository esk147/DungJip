package com.kh.dungjip.common.websocket.server;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.json.simple.JSONObject;
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

	private ChatService wcs;
	
	
	private Set<WebSocketSession> users =  new CopyOnWriteArraySet<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		users.add(session);

	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		//본인의 아이디와 전달할 메세지 붙여서 전달해놓기 
	
		
		//현재시간
		LocalDateTime now = LocalDateTime.now();//Date로 할려해봤는데 localDateTime을 더 권장한다 해서 이걸로 함
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-ddEEEE HH:mm:ss");//심플데이트포멧이랑 같은거임
		
		String formattedDateTime = now.format(formatter);
			
		String date=formattedDateTime.substring(5,10)+"("+formattedDateTime.substring(10,11)+")"+formattedDateTime.substring(13);
		//date = 12-07(목) 14:50:01
		//원래 now 가 2023-12-07 (목요일) 14:50:01 인데 너무 길어서 짜름(연도가 바뀌면 어케할꺼냐? 그건 추후에 생각 )
		//사용자의 순번 받아오기 (pk키)
		int userNo= ((Member)(session.getAttributes().get("loginUser"))).getUserNo();
		
		//userId 대신 닉네임 사용
		String userNickName = ((Member)(session.getAttributes().get("loginUser"))).getUserNickName();
		
		
		
		//메세지 받아오는 작업
		String text = message.getPayload();
		ChatMessage c = new ChatMessage(text,userNo,formattedDateTime);
		
		ArrayList<ChatMessage> cm = new ArrayList<>();
		
		cm.add(c);
		wcs.insertMsg(cm);
		
		
		JSONObject jobj = new JSONObject();
		
		jobj.put("userNickName", userNickName);
		jobj.put("text", text);
		jobj.put("date", date);
		jobj.put("userNo", userNo);
		
		
		String jobjString = jobj.toString();
		TextMessage jobjMessage = new TextMessage(jobjString);

		//저장소에 담겨있는 회원들에게 메세지 전달하기
		for(WebSocketSession s : users) {
			s.sendMessage(jobjMessage);
			
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		users.remove(session);
		log.info("접속 종료 ! 접속한 사용자 수 : {}",users.size());
		
	}

}
