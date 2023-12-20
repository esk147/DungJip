package com.kh.dungjip.member.model.server;

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

	//로그인시 현재시간 집어넣기
	@Override
	public int updateLastLoginTime(Member loginUser) {

		
		return memberDao.updateLastLoginTime(sqlSession,loginUser);
	}

	//이전 로그인 할때는 현재시간이 없어서 현재 시간 추가된 select문 가져옴
	@Override
	public Member loginMemberPlusCurrentTime(Member beginLoginUser) {

		
		return memberDao.loginMemberPlusCurrentTime(sqlSession,beginLoginUser);
	}


	@Override
	public int LastLogoutTime(int userNo) {//로그아웃 할떄의 시간
		// TODO Auto-generated method stub
		return memberDao.LastLogoutTime(sqlSession,userNo);
	}



	



	

}
