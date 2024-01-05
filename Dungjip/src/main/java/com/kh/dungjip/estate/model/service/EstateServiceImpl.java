package com.kh.dungjip.estate.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.estate.model.dao.EstateDao;

import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.estate.model.vo.EstateReview;

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

	//부동산 리뷰 리스트
	@Override
	public ArrayList<EstateReview> selectEstateReviewList(int esNo) {
	
		return estateDao.selectEstateReviewList(sqlSession,esNo);
	}

	//부동산 리뷰 총점
	@Override
	public int selectEstateReviewSum(int esNo) {
		
		return estateDao.selectEstateReviewSum(sqlSession,esNo);
	}

	//부동산 리뷰 개수
	@Override
	public int selectEstateReviewCount(int esNo) {
		
		return estateDao.selectEstateReviewCount(sqlSession,esNo);
	}

	
	//각 별의 개수
	@Override
	public int selectEstateFiveStar(int esNo) {
	
		return estateDao.selectEstateFiveStar(sqlSession,esNo);
	}
	
	@Override
	public int selectEstateFourStar(int esNo) {
	
		return estateDao.selectEstateFourStar(sqlSession,esNo);
	}

	
	@Override
	public int selectEstateThreeStar(int esNo) {
	
		return estateDao.selectEstateThreeStar(sqlSession,esNo);
	}

	
	@Override
	public int selectEstateTwoStar(int esNo) {
	
		return estateDao.selectEstateTwoStar(sqlSession,esNo);
	}

	
	@Override
	public int selectEstateOneStar(int esNo) {
	
		return estateDao.selectEstateOneStar(sqlSession,esNo);
	}

	
	@Override
	public List<Integer> selectSubscribeEstateList() {
		return estateDao.selectSubscribeEstateList(sqlSession);
	}


	//리뷰 작성
	@Override
	public int insertEstateReview(Map<String, Object> paramMap) {

		return estateDao.insertEstateReview(sqlSession,paramMap);
	}


	//조회
	@Override
	public ArrayList<EstateReview> selectEstateReview(Member m) {
		// TODO Auto-generated method stub
		return estateDao.selectEstateReview(sqlSession,m);
	}

	//삭제
	@Override
	public int esReviewDelete(int esReNo) {
		// TODO Auto-generated method stub
		return estateDao.esReviewDelete(sqlSession,esReNo);
	}

	@Override
	public int updateReview(int esReNo, int esReScore, String esReContent) {
		// TODO Auto-generated method stub
		return estateDao.updateReview(sqlSession,esReNo,esReScore,esReContent );
	}

	//리뷰 공감수
	@Override
	public int selectEstateEmoCount(int esReNo) {
		
		return estateDao.selectEstateEmoCount(sqlSession,esReNo);
	}

	//부동산 리뷰 상세
	@Override
	public EstateReview estateReviewDetail(int esReNo) {
		
		return estateDao.estateReviewDetail(sqlSession,esReNo);
	}


	//부동산 리뷰 수정
	@Override
	public int updateEstateReview(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return estateDao.updateReview(sqlSession,paramMap);
	}
	
	
	
}
