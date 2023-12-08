package com.kh.dungjip.member.model.server;

import com.kh.dungjip.member.model.vo.Member;

public interface MemberService {
	
	//로그인 처리 
	Member loginMember(Member m);

	//아이디중복체크
	int ajaxMethod1(String userId);


}
