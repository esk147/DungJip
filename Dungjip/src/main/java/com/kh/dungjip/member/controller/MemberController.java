package com.kh.dungjip.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dungjip.member.model.server.MemberService;
import com.kh.dungjip.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
	
	@RequestMapping("login.me")
	public String loginMember () {
		
		return "member/memberLoginForm";
	}
	
	
	//로그인 
//	@RequestMapping("login.me")
//	public String loginMember (Member m, HttpSession session, ModelAndView mv) {
//		
//		//아이디를 가지고 db에서 일치하는 회원정보 조회 
//		Member loginUser = memberService.loginMember(m);
//		
//		//bcryptPasswordEncoder.matches(평문, 암호문)를 이용 (일치하면 true 아니면 false) 
//		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { //성공시
//			
//			//값 담아주고 메인페이지로 이동시키기 
//			session.setAttribute("loginUser", loginUser);				
//			mv.setViewName("redirect:/");
//			
//		}else {
//			
//			mv.addObject("errorMsg","로그인 실패"); 			
//			mv.setViewName("common/errorPage");
//		}
//		
//		//return "mv";
//	}
	
	
	
	//로그아웃 
	@RequestMapping("logout.me")
	public String loginMember(HttpSession session) {
		
		//세션에 담겨있는 logoutUser정보 지우기 
		session.removeAttribute("loginUser");
		
		//로그아웃 처리 후 메인 페이지 재 요청 
		return "redirect:/";
	}
	
	//회원가입 
	@RequestMapping("enroll.me")
	public String memberEnroll () {
		return "member/memberEnrollForm";
	}
	
	//아이디 중복 체크 
	@ResponseBody
	@RequestMapping("idcheck.me")
	public int ajaxMethod1 (@RequestParam("userId") String userId, HttpServletResponse resp) {
		
		int result = memberService.ajaxMethod1(userId);
		
		return result;
	}
}
