package com.kh.dungjip.house.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.house.model.dao.HouseDao;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Jjim;
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

	//집 상세보기
	@Override
	public House selectHouseDetail(int houseNo) {
		return houseDao.selectHouseDetail(sqlSession,houseNo);
	}

	//상세보기 집 이미지
	@Override
	public ArrayList<HouseImg> selectHouseImgDetail(int houseNo) {
		return houseDao.selectHouseImgDetail(sqlSession,houseNo);
	}

	//비슷한 매물 찾기 list
	@Override
	public ArrayList<House> houseLikeList(String houseAddress,PageInfo pi) {
		return houseDao.houseLikeList(sqlSession,houseAddress,pi);
	}

	//비슷한 매물 찾기 img
	@Override
	public ArrayList<HouseImg> houseImgLike(String houseAddress) {
		return houseDao.houseImgLike(sqlSession,houseAddress);
	}
	
	@Override
	public ArrayList<House> selectHouseMain(String type) {
		return houseDao.selectHouseMain(sqlSession, type);
	}

	@Override
	public HouseImg selectHouseMainThumnail(int houseNo) {
		return houseDao.selectHouseMainThumnail(sqlSession, houseNo);
	}

	@Override
	public ArrayList<House> selectSubscribeHouseList(Map<String, Object> map) {
		return houseDao.selectSubscribeHouseList(sqlSession, map);
	}

	//비슷한 매물 전체 개수
	@Override
	public int selectHouseLikeCount(String houseAddress) {
		return houseDao.selectHouseLikeCount(sqlSession, houseAddress);
	}

}
