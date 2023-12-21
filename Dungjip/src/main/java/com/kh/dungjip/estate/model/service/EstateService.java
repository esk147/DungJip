package com.kh.dungjip.estate.model.service;

import java.util.ArrayList;

import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.estate.model.vo.EstateReview;

public interface EstateService {

	//부동산 리스트
	ArrayList<Estate> selectEstateList(int houseNo);

	//조회수 증가
	int increaseCount(int esNo);

	//부동산 상세정보
	Estate estateDetail(int esNo);

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



}
