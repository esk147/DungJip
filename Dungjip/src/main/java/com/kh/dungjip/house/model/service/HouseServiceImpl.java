package com.kh.dungjip.house.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.house.model.dao.HouseDao;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HouseServiceImpl implements HouseService{
	
	@Autowired
	private HouseDao houseDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertHouseJSON(House house) {
		return houseDao.insertHouseJSON(sqlSession, house);
	}

	@Override
	public ArrayList<House> selectLocations() {
		return houseDao.selectLocations(sqlSession);
	}

	@Override
	public ArrayList<House> selectHouse(String type) {
		return houseDao.selectHouse(sqlSession, type);
	}

	@Override
	public ArrayList<HouseImg> selectHouseThumnail() {
		return houseDao.selectHouseThumnail(sqlSession);
	}

	//부동산 집 리스트
	@Override
	public ArrayList<House> selectHouseList(int esNo,PageInfo pi) {
		
		return houseDao.selectHouseList(sqlSession,esNo,pi);
	}

	//부동산 집 이미지
	@Override
	public ArrayList<HouseImg> selectHouseImg(int esNo) {
		
		return houseDao.selectHouseImg(sqlSession,esNo);
	}

	//부동산이 갖고있는 집 개수
	@Override
	public int selectHouseListCount(int esNo) {
		
		return houseDao.selectHouseListCount(sqlSession,esNo);
	}

	@Override
	public ArrayList<House> selectHouseMain(String type) {
		return houseDao.selectHouseMain(sqlSession, type);
	}

	@Override
	public HouseImg selectHouseMainThumnail(int houseNo) {
		return houseDao.selectHouseMainThumnail(sqlSession, houseNo);
	}

}
