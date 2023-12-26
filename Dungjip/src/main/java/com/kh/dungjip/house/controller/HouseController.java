package com.kh.dungjip.house.controller;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
<<<<<<< HEAD
import java.util.Map;
=======
import java.util.List;
import java.util.Map;
import java.util.Random;
>>>>>>> branch 'develop' of https://github.com/esk147/DungJip.git

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;
import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.estate.model.service.EstateService;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.house.model.service.HouseService;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Jjim;
import com.kh.dungjip.member.model.vo.Member;

@Controller
public class HouseController {

	@Autowired
	private HouseService houseService;

	@Autowired
	private EstateService estateService;

	@RequestMapping("insert.house")
	public String insertHouse(HttpSession session) throws IOException, ParseException {

		Reader reader = new FileReader(
				"C:\\Users\\tlsal\\git\\DungJip\\Dungjip\\src\\main\\webapp\\WEB-INF\\resources\\jik.json");

		JSONParser parser = new JSONParser();
		Object obj = parser.parse(reader);
		JSONObject jsonMain = (JSONObject) obj;
		JSONArray jsonArr = (JSONArray) jsonMain.get("items");

		ArrayList<House> hlist = new ArrayList<>();

		for (int i = 0; i < jsonArr.size(); i++) {
			JSONObject object = (JSONObject) jsonArr.get(i);
			JSONObject sqrtP = (JSONObject) object.get("sqrtP");
			JSONObject location = (JSONObject) object.get("random_location");

			String isoDate = String.valueOf(object.get("reg_date"));
			String buildDate = String.valueOf(object.get("build_date"));
			ZonedDateTime zonedDateTime = ZonedDateTime.parse(isoDate, DateTimeFormatter.ISO_DATE_TIME);
			ZonedDateTime zonedBuildDateTime = ZonedDateTime.parse(buildDate, DateTimeFormatter.ISO_DATE_TIME);
			LocalDateTime localDateTime = zonedDateTime.toLocalDateTime();
			LocalDateTime localBuildDateTime = zonedBuildDateTime.toLocalDateTime();

			Date sqlDate = Date.valueOf(localDateTime.toLocalDate());
			Date sqlBuildDate = Date.valueOf(localBuildDateTime.toLocalDate());
<<<<<<< HEAD

			House house = House.builder().housePrice((String) object.get("deposit"))
					.houseRent(Integer.parseInt(String.valueOf(object.get("rent"))))
					.houseSquare(Double.parseDouble(String.valueOf(sqrtP.get("p"))))
					.houseStyle((String) object.get("sales_type")).houseTitle((String) object.get("title"))
					.houseDetails((String) object.get("details")).houseType((String) object.get("service_type"))
					.houseLatitude((Double) location.get("lat")).houseLongitude((Double) location.get("lng"))
					.houseUploadTime(sqlDate).houseAddress((String) object.get("address1"))
					.houseFloor(Integer.parseInt(String.valueOf(object.get("floor"))))
					.houseBuildingFloor(Integer.parseInt(String.valueOf(object.get("building_floor"))))
					.houseToilet(Integer.parseInt(String.valueOf(object.get("toilet"))))
					.houseRooms(Integer.parseInt(String.valueOf(object.get("rooms"))))
					.houseParkAble(Integer.parseInt(String.valueOf(object.get("park_able"))))
					.houseBalcony((String) object.get("balcony"))
					.houseMaintainCost(Integer.parseInt(String.valueOf(object.get("maintain_cost"))))
					.houseDoItNow((String) object.get("doItNow")).houseBuildDate(sqlBuildDate)
					.houseAnimals((String) object.get("animals")).build();
=======
			
			House house = House.builder()
											.housePrice(Integer.parseInt(String.valueOf(object.get("deposit"))))
											.houseRent(Integer.parseInt(String.valueOf(object.get("rent"))))
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
											.houseToilet(Integer.parseInt(String.valueOf(object.get("toilet"))))
											.houseRooms(Integer.parseInt(String.valueOf(object.get("rooms"))))
											.houseParkAble(Integer.parseInt(String.valueOf(object.get("park_able"))))
											.houseBalcony((String)object.get("balcony"))
											.houseMaintainCost(Integer.parseInt(String.valueOf(object.get("maintain_cost"))))
											.houseDoItNow((String)object.get("doItNow"))
											.houseBuildDate(sqlBuildDate)
											.houseAnimals((String)object.get("animals"))
											.houseName((String)object.get("name"))
											.build();
			
>>>>>>> branch 'develop' of https://github.com/esk147/DungJip.git
			hlist.add(house);
		}

		int result = 1;

		int index = 1;
		for (House house : hlist) {
			int count = houseService.insertHouseJSON(house);

			if (result * count == 0) {
				session.setAttribute("alertMsg", "집 등록 실패");
				return "common/errorPage";
			}

			index++;
		}

		session.setAttribute("alertMsg", "집 등록 성공");
		return "main";

	}

	@ResponseBody
	@RequestMapping("select.location")
	public ArrayList<House> selectLocation() {
		ArrayList<House> lList = houseService.selectLocations();
<<<<<<< HEAD
		ArrayList<HouseImg> hImgList = new ArrayList<>();

=======
		
>>>>>>> branch 'develop' of https://github.com/esk147/DungJip.git
		return lList;
	}

	// 집 상세페이지
	@RequestMapping("detail.ho")
	public String houseDetail(HttpSession session, int houseNo, String houseAddress, Model model) {

		// 부동산 목록 조회해서 보여주기
		ArrayList<Estate> elist = estateService.selectEstateList(houseNo);
		model.addAttribute("elist", elist);

		//집 상세보기
		House house = houseService.selectHouseDetail(houseNo);
		model.addAttribute("house", house);
	
		//상세보기 집 이미지
		ArrayList<HouseImg> houseImg = houseService.selectHouseImgDetail(houseNo);
		model.addAttribute("houseImg",houseImg);
		
		//찜 데이터 있는지 없는지 확인
		Member loginUser = ((Member) session.getAttribute("loginUser"));
		if (loginUser == null) {
			return "house/houseDetail";
		} else {
			Jjim jjim = Jjim.builder().houseNo(houseNo).userNo(loginUser.getUserNo()).build();
			Jjim jj = houseService.selectJjim(jjim);
			model.addAttribute("jj", jj);
			return "house/houseDetail";
		}
	}

	// 집 리스트
	@RequestMapping("villa.map")

	public ModelAndView villaMap(String locate, String type, ModelAndView mv) {
		ArrayList<House> lList = houseService.selectHouse(type);
		ArrayList<HouseImg> hImgList = houseService.selectHouseThumnail();

		mv.addObject("lList", lList).addObject("locate", locate).addObject("hImgList", hImgList).addObject("type", type)
				.setViewName("house/houseMap");

		return mv;
	}

	
	@ResponseBody
	@RequestMapping("select.house")
	public Map<String, Object> selectHouse(String type) {
		
		//타입별 집 리스트
		ArrayList<House> mainList = houseService.selectHouseMain(type);
		//타입별 집 이미지 리스트
		ArrayList<HouseImg> imgList = new ArrayList<>();
		for(House h : mainList) {
			HouseImg img = houseService.selectHouseMainThumnail(h.getHouseNo());
			
			imgList.add(img);
		}
		//구독한 중개인 리스트
		List<Integer> subscribeUser = estateService.selectSubscribeEstateList();
		//랜덤 중개인 번호
		Integer randomUser = pickRandomNumber(subscribeUser);
		
		Map<String, Object> map = new HashMap();
		
		map.put("type", type);
		map.put("randomUser", randomUser);
		//랜덤 중개인 집 리스트
		ArrayList<House> subscribeHouseList = houseService.selectSubscribeHouseList(map);
		
		System.out.println(subscribeHouseList);
		//랜덤 중개인 랜덤 집 번호
		Integer randomIndex = pickRandomNumber(subscribeHouseList);
		
		System.out.println(randomIndex);
		//랜덤 중개인 랜덤 집
		House randomSubscribeHouse = new House();
		if(randomIndex != null) {
			randomSubscribeHouse = subscribeHouseList.get(randomIndex);
		}
		//랜덤 중개인 랜덤 집 이미지
		HouseImg subscribeImg = houseService.selectHouseMainThumnail(randomSubscribeHouse.getHouseNo());
		
		Map<String, Object> recomendHouse = new HashMap();
		recomendHouse.put("mainList", mainList);
		recomendHouse.put("imgList", imgList);
		recomendHouse.put("randomSubscribeHouse", randomSubscribeHouse);
		recomendHouse.put("subscribeImg", subscribeImg);
		
		return recomendHouse;
	}
	
	public static Integer pickRandomNumber(List<Integer> numbers) {
        if (numbers == null || numbers.isEmpty()) {
            return null;
        }

        Random random = new Random();
        int randomIndex = random.nextInt(numbers.size());
        return numbers.get(randomIndex);
    }
	
	public static Integer pickRandomNumber(ArrayList<House> numbers) {
        if (numbers == null || numbers.isEmpty()) {
            return null;
        }

        Random random = new Random();
        int randomIndex = random.nextInt(numbers.size());
        return randomIndex;
    }
}
