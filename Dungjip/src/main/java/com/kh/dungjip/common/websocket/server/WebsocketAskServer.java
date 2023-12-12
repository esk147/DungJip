package com.kh.dungjip.common.websocket.server;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.dungjip.common.websocket.model.service.ChatService;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
@Slf4j

public class WebsocketAskServer extends TextWebSocketHandler {

	@Autowired
	private ChatService chatService;
	
	
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
		
		//int result = chatService.createRoom(c);//채팅방 생성은 일단 메세지부터 구현한다음에 ..

		String text = message.getPayload();//text는 JSON 타입으로 내가 보내놨다
		
		//JSON해체 작업
		  JSONParser parser = new JSONParser();
		  //JSONParser는 JSON 형식의 문자열을 Java 객체로 파싱해주는 라이브러리나 클래스.
		  //사용된 JSONParser는 org.json.simple.parser.JSONParser
		  
		  JSONObject jobj2 = (JSONObject)parser.parse(text);//파싱작업
		  
		  String preCno=(String)jobj2.get("cno");
		  int chatRoomNo = Integer.parseInt(preCno);
		  String contentMessage = (String)jobj2.get("message");
		 
		
		  ChatMessage c = new ChatMessage(contentMessage,chatRoomNo,userNo,userNickName);
	
		  	
		  try {
			    int result = chatService.updateChatRoomMsg(c);
			    
			    System.out.println(result);
			    // 결과 처리 등...
			} catch (Exception e) {
			    e.printStackTrace(); // 예외 메시지 출력
			    System.out.println("예외");
			    //굳이 try catch 한이유는 채팅방에 저장이 안되면 오류구문이안나와서 강제로 오류구문 발생시키기 위함
			    // 예외 처리 로직 추가
			}

		
		
		JSONObject jobj = new JSONObject();
		jobj.put("userNickName", userNickName);
		jobj.put("text",contentMessage);
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
	
		
	}

}
