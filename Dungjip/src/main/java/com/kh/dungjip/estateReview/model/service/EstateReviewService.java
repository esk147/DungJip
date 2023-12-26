package com.kh.dungjip.estateReview.model.service;

import java.util.ArrayList;

import com.kh.dungjip.estateReview.model.vo.EstateReview;
import com.kh.dungjip.member.model.vo.Member;

public interface EstateReviewService  {
	
	//조회
	ArrayList<EstateReview> selectEstateReview(Member m);

	//삭제
	int esReviewDelete(int esReNo);

	//수정
	int updateReview(int esReNo, int esReScore, String esReContent);

}
