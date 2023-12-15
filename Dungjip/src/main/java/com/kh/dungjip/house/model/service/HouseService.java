package com.kh.dungjip.house.model.service;

import java.util.ArrayList;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

public interface HouseService {

	int insertHouseJSON(House house);

	ArrayList<House> selectLocations();

	ArrayList<House> selectHouse();

	ArrayList<HouseImg> selectHouseThumnail();

}
