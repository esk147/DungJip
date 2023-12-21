package com.kh.dungjip.estate.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.estate.model.vo.Estate;

@Repository
public class EstateDao {

	//부동산 리스트
	public ArrayList<Estate> selectEstateList(SqlSessionTemplate sqlSession,int houseNo) {
		
		return (ArrayList)sqlSession.selectList("estateMapper.selectEstateList",houseNo);
	}

	//조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.update("estateMapper.increaseCount",esNo);
	}

	//부동산 상세정보
	public Estate estateDetail(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.estateDetail",esNo);
	}

	
}
