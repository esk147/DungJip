package com.kh.dungjip.house.model.service;

import java.util.ArrayList;

import com.kh.dungjip.house.model.vo.House;

public interface HouseService {

	int insertHouseJSON(House house);

	ArrayList<House> selectLocations();

}
