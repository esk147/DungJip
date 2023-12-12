package com.kh.dungjip.enquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.enquiry.model.dao.EnquiryDao;
import com.kh.dungjip.enquiry.model.vo.Enquiry;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EnquiryServiceImpl implements EnquiryService{
	
	@Autowired
	private EnquiryDao enquiryDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//1:1문의 등록
	@Override
	public int insertEnquiry(Enquiry en) {
		return enquiryDao.insertEnquiry(sqlSession,en);
	}
	//1:1문의 내역
	@Override
	public ArrayList<Enquiry> selectEnList() {
		return enquiryDao.selectEnList(sqlSession);
	}
	//관리자 댓글 등록
	@Override
	public int insertReply(Enquiry en) {
		return enquiryDao.insertReply(sqlSession, en);
	}
	
}
