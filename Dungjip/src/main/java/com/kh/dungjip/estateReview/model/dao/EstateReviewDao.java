package com.kh.dungjip.estateReview.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.estateReview.model.vo.EstateReview;
import com.kh.dungjip.member.model.vo.Member;

@Repository
public class EstateReviewDao {

	public ArrayList<EstateReview> selectEstateReview(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("estateReviewMapper.selectEstateReview", m);
	}

	public int esReviewDelete(SqlSessionTemplate sqlSession, int esReNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("estateReviewMapper.esReviewDelete", esReNo);
	}

	public int updateReview(SqlSessionTemplate sqlSession, int esReNo, int esReScore, String esReContent) {
		Map<String, Object> params = new HashMap<>();
	    params.put("esReNo", esReNo);
	    params.put("esReScore", esReScore);
	    params.put("esReContent", esReContent);
	    return sqlSession.update("estateReviewMapper.updateReview", params);
	}

}
