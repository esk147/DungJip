package com.kh.dungjip.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	  @RequestMapping("login.be") public String loginMember () {
	  
	  return "member/memberLoginForm"; 
	  
	  }
	 
	
	
	//로그인 
	@RequestMapping("login.me")
	public ModelAndView loginMember (Member m, HttpSession session, ModelAndView mv, HttpServletResponse response ,HttpServletRequest request) {
		
		//아이디 추출
		String userId = request.getParameter("userId");
		
		String saveId = request.getParameter("saveId");
		//쿠키준비
		Cookie cookies = null;
		
		//만약 체크가 되어 넘어왔다면
		if(saveId != null && saveId.equals("on")) {
			//쿠키의 이름과 값을 넣어서 생성하기
			cookies = new Cookie("userId",userId);
			//쿠키의 수명을 정해서 추가한다.
			cookies.setMaxAge(60*60*24); //하루 : 60*60*24 (초단위)
			//응답객체인 response에 쿠키 추가하기
			response.addCookie(cookies);
		}else {//체크가 되지 않았다면
			//쿠키 지워주기
			cookies = new Cookie("userId",null);
			//수명을 0으로 만들어주기
			cookies.setMaxAge(0);
			//응답객체에 쿠키 담기
			response.addCookie(cookies);
		}
		
		//아이디를 가지고 db에서 일치하는 회원정보 조회 
		Member loginUser = memberService.loginMember(m);
		
		//bcryptPasswordEncoder.matches(평문, 암호문)를 이용 (일치하면 true 아니면 false) 
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { //성공시
		
			
			System.out.println("로그인 성공 " );
			
			//값 담아주고 메인페이지로 이동시키기 
			session.setAttribute("loginUser", loginUser);				
			mv.setViewName("main");
						
		}else {
			
			//System.out.println("로그인 실패 " );

			
			mv.addObject("errorMsg","로그인 실패"); 			
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
		
	//로그아웃 
	@RequestMapping("logout.me")
	public String loginMember(HttpSession session) {
		
		//세션에 담겨있는 logoutUser정보 지우기 
		session.removeAttribute("loginUser");
		
		//로그아웃 처리 후 메인 페이지 재 요청 
		return "redirect:/";
	}
		
	//이용동의
	@RequestMapping("agree.me")
	public String memberAgree () {
		
		return "member/memberagreeForm";
	}
	
	//회원가입 type 페이지로 이동 
	@RequestMapping("enrollType.me")
	public String memberEnrollType () {
		
		return "member/memberEnrollTypeForm";
	}

	//회원가입 (임대인/임차인) 폼으로 이동 
	@RequestMapping("enroll.me")
	public String memberEnroll () {
		return "member/memberEnrollForm";
	}
	
	//회원등록 (임대인/임차인)
	@RequestMapping("insert.me")
	public String insertMember(Member m,Model model, HttpSession session) {
		
		//System.out.println("평문 : "+m.getUserPwd());
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		//System.out.println("암호문 : "+encPwd );
		
		m.setUserPwd(encPwd);
		
		int insertUser = memberService.insertMember(m);
		
		if(insertUser > 0) { //성공 시 
			
			return "member/memberEnrollResult";
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage"; //포워딩 
		}
		
	}
	
	//아이디 중복 체크 (임대인/임차인)
	@ResponseBody
	@RequestMapping("ajaxId.do")
	public int ajaxIdMethod(@RequestParam("userId") String userId, HttpServletResponse resp) {
				
		int result = memberService.ajaxIdMethod(userId);
		
		return result;		
	}
	
	
}
