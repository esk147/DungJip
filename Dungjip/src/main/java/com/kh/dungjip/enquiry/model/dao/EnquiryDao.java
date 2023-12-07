package com.kh.dungjip.enquiry.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.enquiry.model.vo.Enquiry;

@Repository
public class EnquiryDao {

	//1:1문의 등록
	public int insertEnquiry(SqlSessionTemplate sqlSession, Enquiry en) {
		return sqlSession.insert("enquiryMapper.insertEnquiry",en);
	}

}
