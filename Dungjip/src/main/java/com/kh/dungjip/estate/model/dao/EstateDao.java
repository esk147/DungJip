package com.kh.dungjip.estate.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.estate.model.vo.EstateReview;
import com.kh.dungjip.house.model.vo.Time;

@Repository
public class EstateDao {

	//부동산 리스트
	public ArrayList<Estate> selectEstateList(SqlSessionTemplate sqlSession,int houseNo) {
		
		return (ArrayList)sqlSession.selectList("estateMapper.selectEatateList",houseNo);
	}

	//조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.update("estateMapper.increaseCount",esNo);
	}

	//부동산 상세정보
	public Estate estateDetail(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.estateDetail",esNo);
	}

	//부동산 리뷰 리스트
	public ArrayList<EstateReview> selectEstateReviewList(SqlSessionTemplate sqlSession, int esNo) {
		
		return (ArrayList)sqlSession.selectList("estateMapper.selectEstateReviewList",esNo);
	}

	//부동산 리뷰 총점
	public int selectEstateReviewSum(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.selectEstateReviewSum",esNo);
	}

	//부동산 리뷰 개수
	public int selectEstateReviewCount(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.selectEstateReviewCount",esNo);
	}

	//각 별의 개수
	public int selectEstateFiveStar(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.selectEstateFiveStar",esNo);
	}
	
	public int selectEstateFourStar(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.selectEstateFourStar",esNo);
	}

	public int selectEstateThreeStar(SqlSessionTemplate sqlSession, int esNo) {
	
		return sqlSession.selectOne("estateMapper.selectEstateThreeStar",esNo);
	}

	public int selectEstateTwoStar(SqlSessionTemplate sqlSession, int esNo) {
	
		return sqlSession.selectOne("estateMapper.selectEstateTwoStar",esNo);
	}

	public int selectEstateOneStar(SqlSessionTemplate sqlSession, int esNo) {
	
		return sqlSession.selectOne("estateMapper.selectEstateOneStar",esNo);
	}

	public List<Integer> selectSubscribeEstateList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("estateMapper.selectSubscribeEstateList");
	}

	//예약 시간 select
	public ArrayList<Time> selectTime(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("estateMapper.selectTime");
	}

	
}
