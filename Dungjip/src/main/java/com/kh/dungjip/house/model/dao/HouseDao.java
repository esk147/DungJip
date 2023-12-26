package com.kh.dungjip.house.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Jjim;
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

	//집 상세보기
	public House selectHouseDetail(SqlSessionTemplate sqlSession, int houseNo) {
		return sqlSession.selectOne("houseMapper.selectHouseDetail", houseNo);
	}

	//상세보기 집 이미지
	public ArrayList<HouseImg> selectHouseImgDetail(SqlSessionTemplate sqlSession, int houseNo) {
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseImgDetail", houseNo);
	}

	//비슷한 매물 찾기 list
	public ArrayList<House> houseLikeList(SqlSessionTemplate sqlSession, String houseAddress) {
		return (ArrayList)sqlSession.selectList("houseMapper.houseLikeList",houseAddress);
	}

	//비슷한 매물 찾기 img
	public ArrayList<HouseImg> houseImgLike(SqlSessionTemplate sqlSession, String houseAddress) {
		return (ArrayList)sqlSession.selectList("houseMapper.houseImgLike",houseAddress);
	}

}
