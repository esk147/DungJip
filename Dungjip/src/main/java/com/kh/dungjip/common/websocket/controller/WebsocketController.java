package com.kh.dungjip.common.websocket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dungjip.common.websocket.model.service.ChatService;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;
import com.kh.dungjip.common.websocket.model.vo.JoinChat;
//import com.kh.dungjip.common.websocket.model.service.ChatService;
import com.kh.dungjip.member.model.vo.Member;

@Controller
@RequestMapping("/websocket")
public class WebsocketController {

	@Autowired
	private ChatService chatService;

	@GetMapping("/ask")
	public String ask(HttpSession session, int estateUserNo, Model m) {
		// 이제 채팅창이 중복안되게 loginUserNo랑 estateUserNo랑 만들어진 채팅방이 있을때 바로 return값으로 넘아가게 하자

		// 현재 채팅방의 공인중개사 정보 띄우기
		Member estate = chatService.clickIndividualEstate(estateUserNo);// 현재 클릭한 공인중개사의 userNo를 가지고 공인중개사의 정보를 가지고온다.
		m.addAttribute("estate", estate);// ask.jsp에 넘겨줌

		Member loginUser = (Member) session.getAttribute("loginUser");// 현재 세션에 저장되어있는 loginUser의 정보를 가지고온다.

		int loginUserNo = loginUser.getUserNo();

		String estateUserName = estate.getUserName();

		JoinChat createRoom = new JoinChat(loginUserNo, estateUserName);// 채팅방을 만들 유저의 넘버와 채팅방의 이름을 설정

		JoinChat c = new JoinChat(loginUserNo, estateUserNo);
		// chatService.alreadyUsedChatRoomCheck//채팅방이 이미 존재하면 안만들어지게 한다.

		int count = chatService.alreadyUsedChatRoomCheck(c);

		if (count == 0 && loginUserNo != estateUserNo) {//기존에 존재하지 않는 채팅방이면 만들고 존재 하면 if문을 채팅방을 생성하지 말거라

			int createChatRoom = chatService.createChatRoom(createRoom);// 유저가 채팅방을 만든다

			if (createChatRoom > 0) {

				int nowCreateChatRoomMe = chatService.nowCreateChatRoomMe(loginUserNo);// 유저가 방금만든채팅방에 들어간다

				if (nowCreateChatRoomMe > 0) {

					chatService.joinNowCreateChatRoom(estateUserNo);// 상대유저가 유저가 만든 채팅방에 들어간다

				}
			}
		}
		ArrayList<ChatRoom> chatList = chatService.chatRoomList(loginUserNo);// 현재 유저가 채팅하고있는 방의 리스트를 가지고온다.

		/*
		 * List<String> movinArr = new List(); for(ChatRoom cr : chatList) {
		 * 
		 * System.out.println("cr,member"); System.out.println(cr.getMembers()); Member
		 * crM = (Member) cr.getMembers();
		 * 
		 * String movings = crM.calculateTimeAgo();
		 * 
		 * movinArr.add(movings); } System.out.println(chatList);
		 * 
		 */		//Map<String, Object> map = new HashMap();
		
	//	map.put("chatList", chatList);
	//	map.put("movinArr", movinArr);
		m.addAttribute("chatList", chatList);

		return "websocket/ask";
	}

	@ResponseBody
	@PostMapping(value = "/selectChatMsg.ch", produces = "application/json; charset=UTF-8")
	public ArrayList<ChatMessage> selectChatMsg(int cno, Model m) {

		ArrayList<ChatMessage> chatMsg = chatService.selectChatMsg(cno);

		return chatMsg;

	}
	@ResponseBody
	@RequestMapping("/findChat.ch")
	public ArrayList<ChatRoom> findChat(@RequestParam("findChat") String findChat,
											@RequestParam("loginUserNo") int loginUserNo) {
		System.out.println(findChat);
		System.out.println(loginUserNo);
		
		ChatRoom c = new ChatRoom(loginUserNo,findChat);
		
		ArrayList<ChatRoom> cr = chatService.findChat(c);

		System.out.println(cr);
		
		return cr;
		
	}
	

}