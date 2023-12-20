package com.kh.dungjip.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dungjip.estate.model.vo.Estate;
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
		//System.out.println("serviceimple " + loginMember);
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


	//회원가입 메소드 (사용자폼에추가)
	@Override
	public int esInsertMember(Member m) {
		// TODO Auto-generated method stub
		return memberDao.esInsertMember(sqlSession,m);
	}

	//아이디 중복 체크(중개인)
	@Override
	public int esajaxIdMethod(String userId) {
		// TODO Auto-generated method stub
		return memberDao.esajaxIdMethod(sqlSession,userId);
	}

	//번호 중복 체크(중개인)
	@Override
	public int exajaxphoneMethod(String phone) {
		// TODO Auto-generated method stub
		return memberDao.exajaxphoneMethod(sqlSession,phone);
	}
	
	//회원가입 메소드 (중개인폼에추가)
	@Override
	public int insertEsMember(Estate e) {
				
		return memberDao.insertEsMember(sqlSession,e);
	}


	//userID를 이용하여 userNo 데려오기
	@Override
	public int userNum(String userId) {
		// TODO Auto-generated method stub
		return memberDao.userNum(sqlSession,userId);
	}

	//번호 중복 체크(임대인/임차인)
	@Override
	public int ajaxphoneMethod(String phone) {
		// TODO Auto-generated method stub
		return memberDao.ajaxphoneMethod(sqlSession,phone);
	}

	//아이디 찾기
	@Override
	public Member memberFindId(Member m) {
		// TODO Auto-generated method stub
		return memberDao.memberFindId(sqlSession,m);
	}

	//비밀번호 찾기 
	@Override
	public int memberFindPwd(Member m) {
		// TODO Auto-generated method stub
		return memberDao.memberFindPwd(sqlSession,m);
	}

	//새로 부여받은 비밀번호 update
	@Override
	public void updateMemberPwd(Member m) {
		// TODO Auto-generated method stub
		String newPwd = m.getUserPwd(); //새로운 암호화된 비밀번호 가져오기 
		
		memberDao.updateMemberPwd(sqlSession, m);
	}


	@Override
	public int userSubscribe(int userNo) {
		int result = memberDao.userSubscribe(sqlSession, userNo);
		
		return result;
	}

	

	



	

}
