package com.kh.dungjip.common.websocket.server;

import java.net.URI;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
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
    
    private Map<Integer, Set<WebSocketSession>> roomSessions = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        URI uri = session.getUri();
        if (uri != null) {
            String query = uri.getQuery();
            Map<String, String> queryParams = parseQuery(query);

            String chatRoomNoStr = queryParams.get("chatRoomNo");
            if (chatRoomNoStr != null) {
                int chatRoomNo = Integer.parseInt(chatRoomNoStr);
                roomSessions.computeIfAbsent(chatRoomNo, k -> new CopyOnWriteArraySet<>()).add(session);
            }
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // Current time
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-ddEEEE HH:mm:ss");
        String formattedDateTime = now.format(formatter);
        String date = formattedDateTime.substring(5, 10) + "(" + formattedDateTime.substring(10, 11) + ")" + formattedDateTime.substring(13);

        // User info
        int userNo = ((Member)(session.getAttributes().get("loginUser"))).getUserNo();
        String userName = ((Member)(session.getAttributes().get("loginUser"))).getUserName();

        // Message processing
        String text = message.getPayload();
        System.out.println(text);

        // JSON parsing
        JSONParser parser = new JSONParser();
        JSONObject jobj2 = (JSONObject) parser.parse(text);
        String preCno = (String) jobj2.get("cno");
        int chatRoomNo = Integer.parseInt(preCno);
        String contentMessage = (String) jobj2.get("message");

        // Chat message handling
        ChatMessage c = new ChatMessage(contentMessage, chatRoomNo, userNo, userName);
       
            int result = chatService.updateChatRoomMsg(c);
            System.out.println(result);
        

        // Prepare message for sending
        JSONObject jobj = new JSONObject();
        jobj.put("userName", userName);
        jobj.put("text", contentMessage);
        jobj.put("date", date);
        jobj.put("userNo", userNo);
        String jobjString = jobj.toString();
        TextMessage jobjMessage = new TextMessage(jobjString);

        // Send message to users in the same chat room
        Set<WebSocketSession> sessionsInRoom = roomSessions.get(chatRoomNo);
        if (sessionsInRoom != null) {
            for (WebSocketSession s : sessionsInRoom) {
                s.sendMessage(jobjMessage);
                System.out.println(s);
     /*           StandardWebSocketSession[id=68e024d7-6dfb-ea1a-8d3a-eaf55d3c50a4, uri=ws://localhost:9999/dungjip/ask?chatRoomNo=2]
                	StandardWebSocketSession[id=5e4c9eaa-abb9-04a4-ecaa-8f303a0ffe4f, uri=ws://localhost:9999/dungjip/ask?chatRoomNo=2]
*/                
            }
        }
    }


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	
	
	}
	
	 private Map<String, String> parseQuery(String query) {
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
