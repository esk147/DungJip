package com.kh.dungjip.estate.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.estate.model.dao.EstateDao;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.member.model.vo.Member;

@Service
public class EstateServiceImpl implements EstateService {

	@Autowired
	private EstateDao estateDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//부동산 리스트
	@Override
	public ArrayList<Estate> selectEstateList(int houseNo) {
		
		return estateDao.selectEstateList(sqlSession,houseNo);
	}

	//조회수 증가
	@Override
	public int increaseCount(int esNo) {
	
		return estateDao.increaseCount(sqlSession,esNo);
	}

	//부동산 상세정보
	@Override
	public Estate estateDetail(int esNo) {
		
		return estateDao.estateDetail(sqlSession,esNo);
	}

	@Override
	public List<Integer> selectSubscribeEstateList() {
		return estateDao.selectSubscribeEstateList(sqlSession);
	}

	
}
