package com.kh.dungjip.residentReview.model.service;

import java.util.ArrayList;

import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;

public interface ResidentReviewService {

	//조회
	ArrayList<ResidentReview> selectResidentReview(Member m);
	
	//삭제
	int esReviewDelete(int reReviewNo);

	//수정
	int updateReReview(int reReviewNo, int interiorScore, int buildingScore, int trafficScore, int safetyScore,
			int lifeScore, String reAdContent, String reDisContent);

	

}
