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
		Member loginMember = memberDao.loginMember(sqlSession, m);
		System.out.println("serviceimple " + loginMember);
		return memberDao.loginMember(sqlSession, m);
	}
	
	
	//아이디 중복 체크 (임대인/임차인)
	@Override
	public int ajaxIdMethod(String userId) {
		// TODO Auto-generated method stub
		return memberDao.ajaxIdMethod(sqlSession,userId);
	}

	
	//회원가입 메소드 (임대인/임차인)
	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return memberDao.insertMember(sqlSession,m);
	}

	



	

}
