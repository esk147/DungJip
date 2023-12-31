package com.kh.dungjip.estate.controller;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
import com.kh.dungjip.house.model.vo.Time;
import com.kh.dungjip.house.model.vo.Reservation;
import com.kh.dungjip.house.model.vo.ReservationNew;
import com.kh.dungjip.member.model.service.MemberService;
import com.kh.dungjip.member.model.vo.Member;



@Controller
public class EstateController {

	@Autowired
	private EstateService estateService;
	
	@Autowired
	private HouseService houseService;
	
	@Autowired
	private MemberService memberService;
	
	
	//부동산 상세페이지
	@GetMapping("detail.es")
	public String estateDetail(int esNo,Model model) {
		int result = estateService.increaseCount(esNo);
		
		//예약 시간 select
		ArrayList<Time> time = estateService.selectTime();
		model.addAttribute("time", time);
		
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
	public Map<String, Object> selectEstateReviewList(int esNo, int userNo){
		
		ArrayList<EstateReview>erlist = estateService.selectEstateReviewList(esNo);
		List<Integer> erNums = new ArrayList<>();
		List<Integer> reviewBooleans = new ArrayList<>();
		for(EstateReview er : erlist) {
			int num = estateService.selectEstateEmoCount(er.getEsReNo());
			
			Map<String, Object> numMap = new HashMap<>();
			numMap.put("esReNo", er.getEsReNo());
			numMap.put("userNo", userNo);
			
			int result = estateService.selectReviewLikeCount(numMap);
			
			erNums.add(num);
			reviewBooleans.add(result);
		}
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
		map.put("erNums", erNums);
		map.put("reviewBooleans", reviewBooleans);
		
		
		System.out.println("------리뷰 리스트-----------");
		System.out.println(erlist);
		
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("estate.like")
	public Map<String, Object> selectReviewLikeCount(String esReNo, String userNo){

		System.out.println("리뷰 번호, 유저 번호");
		System.out.println(esReNo);
		System.out.println(userNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("esReNo", esReNo);
		map.put("userNo", userNo);
		
		int count = estateService.selectReviewLikeCount(map);
		System.out.println("카운터는 1이여야함 제발");
		System.out.println(count);
		int result = 0;
		
		int bool = 0;
		
		if(count > 0) {
			result = estateService.decreaseCount(map);
			//TODO 공감 해제 값 변수에 넣어서 맵에 넣고 전달
			bool = 1;
		} else {
			result = estateService.increaseEsReLikeCount(map);
			//TODO 공감 클릭 값 변수에 넣어서 맵에 넣고 전달
			bool = 2;
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("emoCount", result);
		resultMap.put("result", bool);
		resultMap.put("esReNo", esReNo);
		
		
		return resultMap;
	}
	
	//예약기능
	@RequestMapping("insertReservation.re")
	public String insertReservation(ReservationNew reservation,HttpSession session) {
		
		System.out.println("컨트롤러 들어오세요");
		
		int result = estateService.insertReservation(reservation);
		int esNo = reservation.getSelectEsNo();
		
		if(result > 0) {
			session.setAttribute("alertMsg", "예약 등록이 되었습니다.");
		}else {
			session.setAttribute("alertMsg", "예약 등록 실패하였습니다."+"관리자에게 문의하세요.");
		}
		
		return "redirect:/detail.es?esNo="+esNo;
	}
	
	//예약 날짜 눌렀을때 데이터 있는지 확인
	@ResponseBody
	@RequestMapping(value="selectReservationList.re",produces="application/json; charset=UTF-8")
	public ArrayList<ReservationNew> selectReservationList(ReservationNew reservation){
		ArrayList<ReservationNew> reservationNew = estateService.selectReservationList(reservation);
		
		return reservationNew;
	}
	
	@GetMapping("insert.esre")
	public String boardEnrollForm(int esNo, HttpSession session, Model model) {
		
		 Member loginUser = (Member) session.getAttribute("loginUser");
		    
		    ArrayList<Reservation> rlist = memberService.selectReservation(loginUser);
		    
		    for(int i=0; i<rlist.size(); i++) {
		    	if (rlist.get(i).getEsNo() == esNo) {
		            // esNo와 일치하는 예약 정보를 찾았을 때 해당 정보를 모델에 추가
		            model.addAttribute("selectedReservation", rlist.get(i));
		            break; // 일치하는 예약 정보를 찾았으므로 반복문 종료
		        }
		    }
		    
		    ArrayList<House> hlist = houseService.selectHouseModal(esNo);
		    ArrayList<HouseImg> himglist = houseService.selectHouseImg(esNo);
		    model.addAttribute("hlist", hlist);
		    model.addAttribute("himglist", himglist);
		
		return "review/estateReviewInsert";
	}
	
	
	
	
	//부동산 리뷰 작성
	@ResponseBody
	@PostMapping(value = "insert.esre", produces = "application/json; charset=UTF-8")
	public Map<String, Object> insertEstateReview(int esNo, HttpSession session, EstateReview er,Model model) {
	    Map<String, Object> response = new HashMap<>();
	    System.out.println(er);
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    ArrayList<Reservation> rlist = memberService.selectReservation(loginUser);
	    
	    for(int i=0; i<rlist.size(); i++) {
	    	if (rlist.get(i).getEsNo() == esNo) {
	            // esNo와 일치하는 예약 정보를 찾았을 때 해당 정보를 모델에 추가
	            model.addAttribute("selectedReservation", rlist.get(i));
	            break; // 일치하는 예약 정보를 찾았으므로 반복문 종료
	        }
	    }



	    if (loginUser != null && er != null) {
	        Map<String, Object> paramMap = new HashMap<>();
	        paramMap.put("er", er);
	        paramMap.put("loginUser", loginUser);
	        
	      

	        int result = estateService.insertEstateReview(paramMap);

	        if (result > 0) {
	            
	            response.put("success", true);
	            response.put("result", result);
	        } else {
	            response.put("success", false);
	            response.put("errorMsg", "부동산 리뷰 등록 실패");
	        }
	    } else {
	        session.setAttribute("alertMsg", "부동산 리뷰 등록 실패");
	        response.put("success", false);
	        response.put("errorMsg", "부동산 리뷰 등록 실패");
	    }

	    return response;
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
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "삭제가 완료되었습니다.");
			
		}else {
			
			session.setAttribute("alertMsg", "다시 시도해주세요.");	
			
		}
		
		return "redirect:/myReviewLike.me";
	}
	
	@RequestMapping("esHdelete.li")
	public String myEstateHouseDelete(@RequestParam("houseNo")int houseNo,Model model, HttpSession session) {
		
		int result = estateService.myEstateHouseDelete(houseNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "삭제가 완료되었습니다.");
		}else {
			session.setAttribute("alertMsg", "다시 시도해주세요.");
		}
		return"redirect:/esHouse.li";
	}
	
	
}
