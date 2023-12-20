package com.kh.dungjip.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.member.model.server.MemberService;
import com.kh.dungjip.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 	
	
	  @RequestMapping("login.be") 
	  public String loginMember () {
	  
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
		Member beginLoginUser = memberService.loginMember(m);
		
		//bcryptPasswordEncoder.matches(평문, 암호문)를 이용 (일치하면 true 아니면 false) 
		if(beginLoginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), beginLoginUser.getUserPwd())) { //성공시

			int SuccessLoginTime =	memberService.updateLastLoginTime(beginLoginUser);//현재 시간 추가 
			
			//굳이 if문 추가안함 
			//현재시간이 추가안되었다고 로그인을 막아버리는 예외가 있으면 안된다고 판단
				//System.out.println("로그인 성공 " );
				Member loginUser = memberService.loginMemberPlusCurrentTime(beginLoginUser);
				
				System.out.println("현재시간 : "+ loginUser);
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
	public String loginMember(@RequestParam ("userNo") int userNo,HttpSession session) {//로그아웃 버튼에 파라미터 영역으로 userNo를 보내주었습니다.
		
		int logoutTime = memberService.LastLogoutTime(userNo);
		
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
	@PostMapping("insert.me")	
	public String insertMember(Member m, Model model, HttpSession session, MultipartFile upfile) {
		
		//System.out.println("평문 : "+m.getUserPwd());
		
		//비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		//System.out.println("암호문 : "+encPwd );
		
		//System.out.println(upfile);
		//첨부파일 
		if(!upfile.getOriginalFilename().equals("")) { //첨부파일이 있을 때
			//전달받은 파일이 있을 경우 - 서버에 업로드 (파일명 수정 후) - 데이터베이스에 정보 등록 

			//파일명 수정하기 
			//1. 원본 파일 명 추출 
			String originName = upfile.getOriginalFilename();
			
			//2. 시간 추출하기
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
			//3. 뒤에 붙이 랜덤값 5자리 추출하기 
			int ranNum = (int)(Math.random()*90000 + 10000);
			
			//4. 원본파일명에서 확장자 추출하기 test.txt - 뒤에서부터 . 을 찾고(lastIndexOf) 그 뒤로 잘라내기(substring)
			String ext = originName.substring(originName.lastIndexOf("."));
			
			//5. 2,3,4 이어붙여서 변경이름 만들기  (업로드 이름)
			String changeName = currentTime + ranNum + ext;
			
			//6. 저장시킬 실직적인 물리적 경로 추출하기 
			String savePath = session.getServletContext().getRealPath("/resources/img/person");
			
			try {
				//7. 경로와 수정파일명으로 파일 업로드 하기 (경로 + 파일명) 파일객체를 생성한 뒤 해당 파일 객체를 업로드시킨다.
				upfile.transferTo(new File(savePath + changeName));				
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			//8. 데이터 베이스에 등록할 변경이름, 원본이름 member VO에 담기 
			m.setOriginName(originName);
			m.setChangeName("/resources/img/person"+changeName);			
			
		}else {
			
			String defaultImagePath = "/resources/img/person/person.jpg";
			
			m.setChangeName(defaultImagePath);
			
		}
			
		m.setUserPwd(encPwd); //암호화된 비번
		
		
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
	
	
	
	
	//회원가입 (중개인) 폼으로 이동 (사용자 폼)
	@RequestMapping("enroll.es")
	public String memberEsEnroll () {
		return "member/memberEsEnrollForm";
	}
	
	/*
	 * //회원가입 (중개인) 다음단계 이동 (부동산 폼)
	 * 
	 * @RequestMapping("insertenroll.es") public String memberEsInsertEnroll () {
	 * return "member/memberEsInsertEnrollForm"; }
	 */
	
	
	//회원등록 (중개인)
	@PostMapping("esinsert.me")	
	public String esInsertMember(Member m, Model model, HttpSession session, MultipartFile upfile) {
		
		//System.out.println("평문 : "+m.getUserPwd());
		//비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		//System.out.println("암호문 : "+encPwd );
		
		//System.out.println(upfile);
		//첨부파일 
		if(!upfile.getOriginalFilename().equals("")) { //첨부파일이 있을 때
			//전달받은 파일이 있을 경우 - 서버에 업로드 (파일명 수정 후) - 데이터베이스에 정보 등록 

			//파일명 수정하기 
			//1. 원본 파일 명 추출 
			String originName = upfile.getOriginalFilename();
			
			//2. 시간 추출하기
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
			//3. 뒤에 붙이 랜덤값 5자리 추출하기 
			int ranNum = (int)(Math.random()*90000 + 10000);
			
			//4. 원본파일명에서 확장자 추출하기 test.txt - 뒤에서부터 . 을 찾고(lastIndexOf) 그 뒤로 잘라내기(substring)
			String ext = originName.substring(originName.lastIndexOf("."));
			
			//5. 2,3,4 이어붙여서 변경이름 만들기  (업로드 이름)
			String changeName = currentTime + ranNum + ext;
			
			//6. 저장시킬 실직적인 물리적 경로 추출하기 
			String savePath = session.getServletContext().getRealPath("/resources/img/person");
			
			try {
				//7. 경로와 수정파일명으로 파일 업로드 하기 (경로 + 파일명) 파일객체를 생성한 뒤 해당 파일 객체를 업로드시킨다.
				upfile.transferTo(new File(savePath + changeName));				
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			//8. 데이터 베이스에 등록할 변경이름, 원본이름 member VO에 담기 
			m.setOriginName(originName);
			m.setChangeName("/resources/img/person"+changeName);			
			
		}else {
			
			String defaultImagePath = "/resources/img/person/person.jpg";
			
			m.setChangeName(defaultImagePath);
			
		}
			
		m.setUserPwd(encPwd); //암호화된 비번
		
		
		int esInsertUser = memberService.esInsertMember(m);
		
		if(esInsertUser > 0) { //성공 시 
			
			//회원등록된 정보 불러오기 (중개인 등록페이지에서 userNo가 필요하기때문에)
			m = memberService.loginMember(m); //로그인유저 매퍼구문 말고 userNo 조회하는 구문으로 변경할것 
			
			model.addAttribute("memberInfo", m);
			
			return "member/memberEsInsertEnrollForm";
			
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage"; //포워딩 
		}
		
	}
	
	//아이디 중복 체크 (중개인)
	@ResponseBody
	@RequestMapping("esajaxId.do")
	public int esajaxIdMethod(@RequestParam("userId") String userId, HttpServletResponse resp) {
				
		int result = memberService.esajaxIdMethod(userId);
		
		return result;		
	}
	
	//번호 중복 체크 (중개인)
	@ResponseBody
	@RequestMapping("exajaxphone.do")
	public int exajaxphoneMethod(@RequestParam("phone") String phone, HttpServletResponse resp) {
				
		int result = memberService.exajaxphoneMethod(phone);
		
		return result;		
	}
		
	//번호 중복 체크 (임차인/임대인)
	@ResponseBody
	@RequestMapping("ajaxphone.do")
	public int ajaxphoneMethod(@RequestParam("phone") String phone, HttpServletResponse resp) {
				
		int result = memberService.ajaxphoneMethod(phone);
		
		return result;		
	}
	
		
	//회원등록 (중개인 폼)
	@PostMapping("insertenroll.es")	
	public String insertEsMember(String userId,Estate e, Model model, HttpSession session) {
		
		/* int selectUserNo = Integer.parseInt(userNo); */
		//Member test = (Member)session.getAttribute("memberInfo");
		int uno = memberService.userNum(userId);
		
		//System.out.println("userId 확인 : "+userId);

		//System.out.println(e);
		/* System.out.println("번호가 올까요"+ userNo); */
		//System.out.println("확인"+ memberInfo);
		
		e.setUserNo(uno);

		int insertEsUser = memberService.insertEsMember(e);
		
		if(insertEsUser > 0) { //성공 시 
			
			return "redirect:/esResult.es";
			
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage"; //포워딩 
		}
		
	}
	
	//중개인 회원가입 완료시 
	@GetMapping("esResult.es")
	public String esResult() {
		
		return "member/memberEnrollResult";
	}
	
	
	
}
