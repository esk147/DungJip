package com.kh.dungjip.estateReview.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.estateReview.model.dao.EstateReviewDao;
import com.kh.dungjip.estateReview.model.vo.EstateReview;
import com.kh.dungjip.member.model.vo.Member;

@Service
public class EstateReviewServiceImpl implements EstateReviewService{

	@Autowired
	private EstateReviewDao estateReviewDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//조회
	@Override
	public ArrayList<EstateReview> selectEstateReview(Member m) {
		// TODO Auto-generated method stub
		return estateReviewDao.selectEstateReview(sqlSession,m);
	}

	//삭제
	@Override
	public int esReviewDelete(int esReNo) {
		// TODO Auto-generated method stub
		return estateReviewDao.esReviewDelete(sqlSession,esReNo);
	}

	//조회
//	@Override
//	public int updateReview(int esReNo) {
//		// TODO Auto-generated method stub
//		return estateReviewDao.updateReview(sqlSession,esReNo);
//	}

	@Override
	public int updateReview(int esReNo, int esReScore, String esReContent) {
		// TODO Auto-generated method stub
		return estateReviewDao.updateReview(sqlSession,esReNo,esReScore,esReContent );
	}
	
	
	
}
