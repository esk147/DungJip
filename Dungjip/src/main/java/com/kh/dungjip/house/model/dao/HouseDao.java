package com.kh.dungjip.house.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;
import com.kh.dungjip.house.model.vo.Jjim;
import com.kh.dungjip.member.model.vo.Member;

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
	
	public ArrayList<House> selectHouseMain(SqlSessionTemplate sqlSession, String type){
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseMain", type);
	}

	public HouseImg selectHouseMainThumnail(SqlSessionTemplate sqlSession, int houseNo) {
		return sqlSession.selectOne("houseMapper.selectHouseMainThumnail", houseNo);
	}

	public ArrayList<House> memberMypageHousejjimForm(SqlSessionTemplate sqlSession, Member m,PageInfo pi) {
		
		//몇개를 보여줄지
		int limit = pi.getBoardLimit();
		//몇개를 건너뛸지
		int offset = (pi.getCurrentPage()-1)* limit;		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("houseMapper.memberMypageHousejjimForm",m,rowBounds);
	}

	public HouseImg memberMypageHousejjimImg(SqlSessionTemplate sqlSession, int houseNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("houseMapper.selectHouseMainThumnail",houseNo);
	}	

	public ArrayList<House> selectSubscribeHouseList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList) sqlSession.selectList("houseMapper.selectSubscribeHouseList", map);
	}


	//부동산 집 리스트(모달창)
	
	public ArrayList<House> selectHouseModal(SqlSessionTemplate sqlSession, int esNo) {
	
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseModal",esNo);
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

	//마이페이지 찜 목록에서 찜 해제
	public int mypageHjjimdelete(SqlSessionTemplate sqlSession, int houseNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("houseMapper.mypageHjjimdelete",houseNo);
	}

	//마이페이지 집 찜 페이징
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("houseMapper.selectListCount");
	}

	public ArrayList<House> memberMypageEstateHouseList(SqlSessionTemplate sqlSession, Integer esNo, PageInfo pi) {
		
		//몇개를 보여줄지
		int limit = pi.getBoardLimit();
		//몇개를 건너뛸지
		int offset = (pi.getCurrentPage()-1)* limit;		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("houseMapper.memberMypageEstateHouseList", esNo, rowBounds);
	}

	//마이페이지 매물내역 페이징
	public int selectEsHouseListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("houseMapper.selectEsHouseListCount");
	}

	//마이페이지 임대인 매물내역 페이징
	public int mypageImdaHouseListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("houseMapper.mypageImdaHouseListCount");
	}
	
	//마이페이지 임대인 매물내역
	public ArrayList<House> mypageImdaHouseList(SqlSessionTemplate sqlSession,PageInfo pi, Member m) {
		
		//몇개를 보여줄지
		int limit = pi.getBoardLimit();
		//몇개를 건너뛸지
		int offset = (pi.getCurrentPage()-1)* limit;		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		return (ArrayList)sqlSession.selectList("houseMapper.mypageImdaHouseList", m,rowBounds);
	}



}
