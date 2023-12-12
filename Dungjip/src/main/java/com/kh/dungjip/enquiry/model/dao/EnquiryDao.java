package com.kh.dungjip.enquiry.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.enquiry.model.vo.Enquiry;

@Repository
public class EnquiryDao {

	//1:1문의 등록
	public int insertEnquiry(SqlSessionTemplate sqlSession, Enquiry en) {
		return sqlSession.insert("enquiryMapper.insertEnquiry",en);
	}

	//1:1문의 내역
	public ArrayList<Enquiry> selectEnList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("enquiryMapper.selectEnList");
		                        
	}

	//관리자 댓글 등록
	public int insertReply(SqlSessionTemplate sqlSession, Enquiry en) {
		return sqlSession.insert("enquiryMapper.insertReply", en);
	}

}
