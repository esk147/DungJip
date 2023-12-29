package com.kh.dungjip.house.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Jjim;
import com.kh.dungjip.house.model.vo.HouseImg;

public interface HouseService {

	int insertHouseJSON(House house);

	ArrayList<House> selectLocations();

	ArrayList<House> selectHouse(String type);
	
	ArrayList<House> selectHouseMain(String type);

	ArrayList<HouseImg> selectHouseThumnail();

	//부동산 집 리스트
	ArrayList<House> selectHouseList(int esNo,PageInfo pi);

	//부동산 집 이미지
	ArrayList<HouseImg> selectHouseImg(int esNo);

	//부동산이 갖고 있는 집 개수
	int selectHouseListCount(int esNo);

	//찜하기
	int insertJjim(Jjim jj);

	//찜 데이터 있는지 확인
	Jjim selectJjim(Jjim jj);

	//찜취소
	int deleteJjim(Jjim jj);

	//집 상세보기
	House selectHouseDetail(int houseNo);

	//상세보기 집 이미지
	 ArrayList<HouseImg> selectHouseImgDetail(int houseNo);

	 //비슷한 매물 찾기 list
	ArrayList<House> houseLikeList(String houseAddress,PageInfo pi);

	//비슷한 매물 찾기 img
	ArrayList<HouseImg> houseImgLike(String houseAddress);
	HouseImg selectHouseMainThumnail(int houseNo);

	ArrayList<House> selectSubscribeHouseList(Map<String, Object> map);

	//비슷한 매물 전체 개수
	int selectHouseLikeCount(String houseAddress);

}
