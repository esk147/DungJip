package com.kh.dungjip.estate.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.kh.dungjip.estate.model.vo.EstateReview;
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
	
	//부동산이 갖고 있는 집 리스트
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
		
		
	    //System.out.println(hlist);
	    //System.out.println("pi:"+pi);
	    //System.out.println(map);
	    //System.out.println("------------------------");
	    //System.out.println(pi.getCurrentPage());
	    
	  
		return map;
	}
	
	//부동산 리뷰 리스트
	@ResponseBody
	@RequestMapping(value="estate.re",produces="application/json; charset=UTF-8")
	public Map<String, Object> selectEstateReviewList(int esNo){
		
		ArrayList<EstateReview>erlist = estateService.selectEstateReviewList(esNo);
		
		//리뷰 총점
		int sum = estateService.selectEstateReviewSum(esNo);
		
		//리뷰개수
		int count = estateService.selectEstateReviewCount(esNo);
		
		//각 별의 개수
		int fiveStar = estateService.selectEstateFiveStar(esNo);
		int fourStar = estateService.selectEstateFourStar(esNo);
		int threeStar = estateService.selectEstateThreeStar(esNo);
		int twoStar = estateService.selectEstateTwoStar(esNo);
		int oneStar = estateService.selectEstateOneStar(esNo);
	
		
	
		Map<String, Object> map = new HashMap<>();
		map.put("erlist", erlist);
		map.put("sum",sum);
		map.put("count", count);
		map.put("fiveStar", fiveStar);
		map.put("fourStar", fourStar);
		map.put("threeStar", threeStar);
		map.put("twoStar", twoStar);
		map.put("oneStar", oneStar);
		
		
		System.out.println("------리뷰 리스트-----------");
		System.out.println(erlist);
		
		
		return map;
	}
	
	//삭제
	@RequestMapping("/estate/delete.es")
	public String esReviewDelete(@RequestParam("esReNo")int esReNo,Model model, HttpSession session) {
		
		int result = estateService.esReviewDelete(esReNo);
		
		System.out.println("번호 넘어오나" + esReNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "삭제가 완료되었습니다.");
			
		}else {
			
			session.setAttribute("alertMsg", "다시 시도해주세요.");	
			
		}
		
		return "redirect:/myEsReview.me";
	}
	
	//수정
	@RequestMapping("updateReview.es")
	public String updateReview(@RequestParam("esReNo") int esReNo,
			 @RequestParam("esReScore") int esReScore,
             @RequestParam("esReContent") String esReContent,Model model, HttpSession session) {
		    
		int result = estateService.updateReview(esReNo,esReScore,esReContent);
		
		System.out.println(esReNo);
		if(result > 0) {
			System.out.println(result);
			session.setAttribute("alertMsg", "수정이 완료되었습니다.");
			return "redirect:/myEsReview.me";
		}else {
			session.setAttribute("alertMsg", "다시 시도해주세요.");
			return "common/errorPage";
		}
		
	}
	
	//공감삭제
	@RequestMapping("estate/esRedelete.me")
	public String myEsReviewDelete(@RequestParam("esReNo")int esReNo,Model model, HttpSession session) {
		
		int result = estateService.myEsReviewDelete(esReNo);
		
		System.out.println("번호 넘어오나" + esReNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "삭제가 완료되었습니다.");
			
		}else {
			
			session.setAttribute("alertMsg", "다시 시도해주세요.");	
			
		}
		
		return "redirect:/myReviewLike.me";
	}
	
	
	
}
