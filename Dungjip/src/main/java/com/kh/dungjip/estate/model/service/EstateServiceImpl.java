package com.kh.dungjip.estate.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.estate.model.dao.EstateDao;
import com.kh.dungjip.estate.model.vo.Estate;

@Service
public class EstateServiceImpl implements EstateService {

	@Autowired
	private EstateDao estateDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//부동산 리스트
	@Override
	public ArrayList<Estate> selectEstateList() {
		
		return estateDao.selectEstateList(sqlSession);
	}
}
