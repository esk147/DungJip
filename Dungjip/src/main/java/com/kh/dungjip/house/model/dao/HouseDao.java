package com.kh.dungjip.house.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

@Repository
public class HouseDao {

	public int insertHouseJSON(SqlSessionTemplate sqlSession, House house) {
		return sqlSession.insert("houseMapper.insertHouseJSON", house);
	}

	public ArrayList<House> selectLocations(SqlSessionTemplate sqlSession) {
		ArrayList<House> list = (ArrayList) sqlSession.selectList("houseMapper.selectLocations");
		return list;
	}

	public ArrayList<House> selectHouse(SqlSessionTemplate sqlSession) {
		ArrayList<House> list = (ArrayList) sqlSession.selectList("houseMapper.selectHouse");
		return list;
	}

	public ArrayList<HouseImg> selectHouseThumnail(SqlSessionTemplate sqlSession) {
		ArrayList<HouseImg> hImgList = (ArrayList) sqlSession.selectList("houseMapper.selectHouseThumnail");
		return hImgList;
	}

}
