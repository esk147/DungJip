package com.kh.dungjip.estate.model.service;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.estate.model.vo.EstateReview;
import com.kh.dungjip.member.model.vo.Member;

public interface EstateService {

	//부동산 리스트
	ArrayList<Estate> selectEstateList(int houseNo);

	//조회수 증가
	int increaseCount(int esNo);

	//부동산 상세정보
	Estate estateDetail(int esNo);

	List<Integer> selectSubscribeEstateList();

	//부동산 리뷰 리스트
	ArrayList<EstateReview> selectEstateReviewList(int esNo);

	//부동산 리뷰 총점
	int selectEstateReviewSum(int esNo);

	//부동산 리뷰 개수
	int selectEstateReviewCount(int esNo);

	//각 별의 개수
	int selectEstateFiveStar(int esNo);
	int selectEstateFourStar(int esNo);
	int selectEstateThreeStar(int esNo);
	int selectEstateTwoStar(int esNo);
	int selectEstateOneStar(int esNo);


	//리뷰 작성
	int insertEstateReview( Map<String, Object> paramMap);


	//조회
	ArrayList<EstateReview> selectEstateReview(Member m);

	//삭제
	int esReviewDelete(int esReNo);

	//수정
	int updateReview(int esReNo, int esReScore, String esReContent);



}
