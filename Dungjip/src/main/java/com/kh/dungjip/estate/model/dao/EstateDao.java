package com.kh.dungjip.estate.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.estate.model.vo.Estate;

@Repository
public class EstateDao {

	//부동산 리스트
	public ArrayList<Estate> selectEstateList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("estateMapper.selectEatateList");
	}

}
