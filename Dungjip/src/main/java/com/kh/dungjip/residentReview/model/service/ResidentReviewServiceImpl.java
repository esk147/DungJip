package com.kh.dungjip.residentReview.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.dao.ResidentReviewDao;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;

@Service
public class ResidentReviewServiceImpl implements ResidentReviewService{

	@Autowired
	private ResidentReviewDao residentReviewDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//조회
	@Override
	public ArrayList<ResidentReview> selectResidentReview(Member m) {
		// TODO Auto-generated method stub
		return residentReviewDao.selectResidentReview(sqlSession,m);
	}

	//삭제
	@Override
	public int esReviewDelete(int reReviewNo) {
		// TODO Auto-generated method stub
		return residentReviewDao.esReviewDelete(sqlSession,reReviewNo);
	}

	//수정
	@Override
	public int updateReReview(int reReviewNo, int interiorScore, int buildingScore, int trafficScore, int safetyScore,
			int lifeScore, String reAdContent, String reDisContent) {
		// TODO Auto-generated method stub
		return residentReviewDao.updateReReview(sqlSession,reReviewNo,interiorScore,buildingScore,trafficScore,safetyScore,lifeScore
													,reAdContent,reDisContent);
	}

}
