package com.kh.dungjip.estate.model.service;

import java.util.ArrayList;

import com.kh.dungjip.estate.model.vo.Estate;

public interface EstateService {

	//부동산 리스트
	ArrayList<Estate> selectEstateList();

}
