package com.kh.dungjip.member.model.server;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.member.model.dao.MemberDao;
import com.kh.dungjip.member.model.vo.Member;

@Service //해당 클래스를 service의 역할로 사용
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//로그인 처리 
	@Override
	public Member loginMember(Member m) {
		// TODO Auto-generated method stub
		return memberDao.loginMember(sqlSession,m);
	}
	
	
	//아이디 중복 체크
	@Override
	public int ajaxMethod1(String userId) {
		// TODO Auto-generated method stub
		return memberDao.ajaxMethod1(sqlSession,userId);
	}




	

}
