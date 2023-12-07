package com.kh.dungjip.common.websocket.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.member.model.vo.Member;

@Controller
@RequestMapping("/websocket")
public class WebsocketController {

	@GetMapping("ask")
	public String ask(HttpSession session) {
		Member loginUser=new Member(1,"1","admin","1234","장재혁","I am 장재혁이에요","26","M","asd@na.com","010-3934-2457",
				"서울시","Y");
		session.setAttribute("loginUser", loginUser);
		return "websocket/ask";//수정입니다
	}

	
}