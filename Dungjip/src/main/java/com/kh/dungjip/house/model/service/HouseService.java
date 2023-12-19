package com.kh.dungjip.house.model.service;

import java.util.ArrayList;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Jjim;

public interface HouseService {

	int insertHouseJSON(House house);

	ArrayList<House> selectLocations();

	ArrayList<House> selectHouse();

	//찜하기
	int insertJjim(Jjim jj);

	//찜 데이터 있는지 확인
	Jjim selectJjim(Jjim jj);

	//찜취소
	int deleteJjim(Jjim jj);

}
