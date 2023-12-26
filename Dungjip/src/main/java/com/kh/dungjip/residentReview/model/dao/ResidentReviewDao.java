package com.kh.dungjip.residentReview.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;

@Repository
public class ResidentReviewDao {

	public ArrayList<ResidentReview> selectResidentReview(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("residentReviewMapper.selectResidentReview",m);
	}

	public int esReviewDelete(SqlSessionTemplate sqlSession, int reReviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("residentReviewMapper.esReviewDelete",reReviewNo);
	}

	public int updateReReview(SqlSessionTemplate sqlSession, int reReviewNo, int interiorScore, int buildingScore,
			int trafficScore, int safetyScore, int lifeScore, String reAdContent, String reDisContent) {
		   
		Map<String, Object> params = new HashMap<>();
		    params.put("reReviewNo", reReviewNo);
		    params.put("interiorScore", interiorScore);
		    params.put("buildingScore", buildingScore);
		    params.put("trafficScore", trafficScore);
		    params.put("safetyScore", safetyScore);
		    params.put("lifeScore", lifeScore);
		    params.put("reAdContent", reAdContent);
		    params.put("reDisContent", reDisContent);

		    return sqlSession.update("residentReviewMapper.updateReReview", params);
	}

}
