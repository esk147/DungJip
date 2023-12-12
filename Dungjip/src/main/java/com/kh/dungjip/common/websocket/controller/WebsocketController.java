package com.kh.dungjip.common.websocket.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dungjip.common.websocket.model.service.ChatService;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;
//import com.kh.dungjip.common.websocket.model.service.ChatService;
import com.kh.dungjip.member.model.vo.Member;


@Controller
@RequestMapping("/websocket")
public class WebsocketController {
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("/ask")
	public String ask(HttpSession session, int mno, Model m) {
		
		

		
		Member loginUser = new Member(2,"1","admin","1234","장재순","재혁짱","26","M","asd@na.com","010-3934-2457", "서울시","Y");
		session.setAttribute("loginUser", loginUser);

		int userNo = loginUser.getUserNo();

		
			ArrayList<ChatRoom> chatList = chatService.chatRoomList(userNo);

			m.addAttribute("chatList", chatList);
			
		return "websocket/ask";
	}
	@ResponseBody
	@PostMapping(value="/selectChatMsg.ch",produces = "application/json; charset=UTF-8")
	public ArrayList<ChatMessage> selectChatMsg(int cno,Model m) {
		
	ArrayList<ChatMessage> chatMsg=	chatService.selectChatMsg(cno);
	
	System.out.println(chatMsg);
	
	return chatMsg;
	
		
	}
	

	
}