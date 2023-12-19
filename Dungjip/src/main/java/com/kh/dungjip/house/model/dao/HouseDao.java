package com.kh.dungjip.house.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Jjim;

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

	//찜하기
	public int insertJjim(SqlSessionTemplate sqlSession, Jjim jj) {
		return sqlSession.insert("houseMapper.insertJjim",jj);
		
	}

	//찜데이터확인
	public Jjim selectJjim(SqlSessionTemplate sqlSession, Jjim jj) {
		return sqlSession.selectOne("houseMapper.selectJjim",jj);
	}

	//찜취소
	public int deleteJjim(SqlSessionTemplate sqlSession, Jjim jj) {
		return sqlSession.delete("houseMapper.deleteJjim",jj);
	}

}
