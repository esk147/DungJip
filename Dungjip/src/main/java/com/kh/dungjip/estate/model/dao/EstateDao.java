package com.kh.dungjip.estate.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.estate.model.vo.EstateReview;

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

	public int selectEstateEmoCount(SqlSessionTemplate sqlSession, int esReNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("estateMapper.selectEstateEmoCount", esReNo);
	}

	public int selectReviewLikeCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			count = sqlSession.selectOne("estateMapper.selectReviewLikeCount", map);
			
			if(count > 0) {
				count = 1;
			}
		} catch(Exception e) {
			count = 0;
		}
		return count;
	}

	public int decreaseCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("estateMapper.decreaseCount", map);
	}

	public int increaseEsReLikeCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("estateMapper.increaseEsReLikeCount", map);
	}

	
}
