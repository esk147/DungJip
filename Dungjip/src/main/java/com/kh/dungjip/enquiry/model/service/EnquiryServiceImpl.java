package com.kh.dungjip.enquiry.model.service;

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
	
}
