package com.kh.dungjip.house.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.house.model.dao.HouseDao;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Jjim;

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
	public ArrayList<House> selectHouse() {
		return houseDao.selectHouse(sqlSession);
	}

	//찜하기
	@Override
	public int insertJjim(Jjim jj) {
		return houseDao.insertJjim(sqlSession,jj);
	}

	//찜 데이터 있는지 확인
	@Override
	public Jjim selectJjim(Jjim jj) {
		return houseDao.selectJjim(sqlSession,jj);
	}

	//찜취소
	@Override
	public int deleteJjim(Jjim jj) {
		return houseDao.deleteJjim(sqlSession,jj);
	}

}
