package com.kh.dungjip.member.model.server;

import com.kh.dungjip.member.model.vo.Member;

public interface MemberService {
	
	//로그인 처리 
	Member loginMember(Member m);

	//아이디 중복체크 (임대인/임차인)
	int ajaxIdMethod(String userId);

	//회원가입 메소드 (임대인/임차인)
	int insertMember(Member m);


}
