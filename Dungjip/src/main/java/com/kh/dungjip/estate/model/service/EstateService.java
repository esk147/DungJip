package com.kh.dungjip.estate.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.member.model.vo.Member;

public interface EstateService {

	//부동산 리스트
	ArrayList<Estate> selectEstateList(int houseNo);

	//조회수 증가
	int increaseCount(int esNo);

	//부동산 상세정보
	Estate estateDetail(int esNo);

	List<Integer> selectSubscribeEstateList();



}
