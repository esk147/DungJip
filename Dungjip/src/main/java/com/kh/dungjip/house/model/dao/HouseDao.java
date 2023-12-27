package com.kh.dungjip.house.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.model.vo.PageInfo;
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

	public ArrayList<House> selectHouse(SqlSessionTemplate sqlSession, String type) {
		ArrayList<House> list = (ArrayList) sqlSession.selectList("houseMapper.selectHouse", type);
		return list;
	}

	public ArrayList<HouseImg> selectHouseThumnail(SqlSessionTemplate sqlSession) {
		ArrayList<HouseImg> hImgList = (ArrayList) sqlSession.selectList("houseMapper.selectHouseThumnail");
		return hImgList;
	}

	//부동산 집 리스트
	public ArrayList<House> selectHouseList(SqlSessionTemplate sqlSession, int esNo, PageInfo pi) {
		
		//몇개씩 보여줄지
		int limit = pi.getBoardLimit();
		
		//몇개씩 건너뛸지
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseList",esNo,rowBounds);
	}

	//부동산 집 이미지
	public ArrayList<HouseImg> selectHouseImg(SqlSessionTemplate sqlSession, int esNo) {
		
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseImg",esNo);
	}

	//부동산이 갖고있는 집 개수
	public int selectHouseListCount(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("houseMapper.selectHouseListCount",esNo);
	}
	
	public ArrayList<House> selectHouseMain(SqlSessionTemplate sqlSession, String type){
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseMain", type);
	}

	public HouseImg selectHouseMainThumnail(SqlSessionTemplate sqlSession, int houseNo) {
		return sqlSession.selectOne("houseMapper.selectHouseMainThumnail", houseNo);
	}

	public ArrayList<House> selectSubscribeHouseList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList) sqlSession.selectList("houseMapper.selectSubscribeHouseList", map);
	}

	//부동산 집 리스트(모달창)
	public ArrayList<House> selectHouseModal(SqlSessionTemplate sqlSession, int esNo) {
	
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseModal",esNo);
	}

}
