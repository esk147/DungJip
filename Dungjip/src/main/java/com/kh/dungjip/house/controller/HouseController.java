package com.kh.dungjip.house.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dungjip.house.model.vo.House;
//
//import com.kh.dungjip.house.model.service.HouseService;

@Controller
public class HouseController {
//
//	@Autowired
//	private HouseService houseService;
	
	@RequestMapping("insert.house")
	public void insertHouse() throws IOException, ParseException {
		Reader reader = new FileReader("/Users/kim-eunseong/git/DungJip/Dungjip/src/main/webapp/WEB-INF/resources/jik.json");
			
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(reader);
		JSONObject jsonMain = (JSONObject) obj;
		
		System.out.println(jsonMain);
		JSONArray jsonArr = (JSONArray) jsonMain.get("items");
		System.out.println(jsonArr);
		
		ArrayList<House> hlist = new ArrayList<>();
		
		for(int i = 0; i < jsonArr.size(); i++) {
			JSONObject object = (JSONObject) jsonArr.get(i);
			JSONObject sqrtP = (JSONObject) object.get("sqrtP");
			JSONObject location = (JSONObject) object.get("random_location");
			
			String isoDate = String.valueOf(object.get("reg_date"));
			ZonedDateTime zonedDateTime = ZonedDateTime.parse(isoDate, DateTimeFormatter.ISO_DATE_TIME);
			LocalDateTime localDateTime = zonedDateTime.toLocalDateTime();
			
			Date sqlDate = Date.valueOf(localDateTime.toLocalDate());
			
			House house = House.builder()
											.housePrice(Integer.parseInt(String.valueOf(object.get("deposit"))))
											.houseSquare(Double.parseDouble(String.valueOf(sqrtP.get("p"))))
											.houseStyle((String)object.get("sales_type"))
											.houseTitle((String)object.get("title"))
											.houseDetails((String)object.get("details"))
											.houseType((String)object.get("service_type"))
											.houseLatitude((Double)location.get("lat"))
											.houseLongitude((Double)location.get("lng"))
											.houseUploadTime(sqlDate)
											.houseAddress((String)object.get("address1"))
											.houseFloor(Integer.parseInt(String.valueOf(object.get("floor"))))
											.houseBuildingFloor(Integer.parseInt(String.valueOf(object.get("building_floor"))))
											.build();
			
			hlist.add(house);
			
		}
		
		for(House house : hlist) {
			System.out.println(house);
		}
		
		
	}
}
