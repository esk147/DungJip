package com.kh.dungjip.estate.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.common.template.Pagination;
import com.kh.dungjip.estate.model.service.EstateService;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.house.model.service.HouseService;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;
import com.kh.dungjip.member.model.vo.Member;



@Controller
public class EstateController {

	@Autowired
	private EstateService estateService;
	
	@Autowired
	private HouseService houseService;
	
	//부동산 상세페이지
	
	
	@GetMapping("detail.es")
	public String estateDetail(int esNo,Model model) {
		
	
		int result = estateService.increaseCount(esNo);
		
		
		if(result>0) {
			
			Estate e = estateService.estateDetail(esNo);
			System.out.println(e);
			model.addAttribute("e",e);
			
		
			
			
	
	
		}else {
			model.addAttribute("errorMsg", "부동산 상제 정보 조회 실패");
			return "common/errorPage";
		}
		
		
		return "estate/estateDetail";
		
	}
	
	@ResponseBody
	@RequestMapping(value="houseList.ho",produces="application/json; charset=UTF-8")
	public Map<String, Object> selectHouseList(int esNo,
			@RequestParam(value="currentPage",defaultValue="1")int currentPage){
		
		//전체 집 개수
		int listCount = houseService.selectHouseListCount(esNo);
		
		System.out.println("집: "+ listCount);
		
		
		//한 페이지에서 보여줘야하는 집 개수
		int boardLimit = 12;
		
		//페이징바 개수
		int pageLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);	
		
		ArrayList<House> hlist = houseService.selectHouseList(esNo,pi);
		ArrayList<HouseImg> himglist = houseService.selectHouseImg(esNo);
		Map<String, Object> map = new HashMap<>();
		map.put("hlist", hlist);
		map.put("pi", pi);
		map.put("himglist", himglist);
		
		
	    System.out.println(hlist);
	    System.out.println("pi:"+pi);
	    System.out.println(map);
	    System.out.println("------------------------");
	    System.out.println(pi.getCurrentPage());
	    
	  
		return map;
	}
	

	
	
}
