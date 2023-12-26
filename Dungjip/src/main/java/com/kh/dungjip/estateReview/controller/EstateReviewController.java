package com.kh.dungjip.estateReview.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dungjip.estateReview.model.service.EstateReviewService;
import com.kh.dungjip.estateReview.model.vo.EstateReview;
import com.kh.dungjip.member.model.service.MemberService;
import com.kh.dungjip.member.model.vo.Member;

@Controller
public class EstateReviewController {
	
	@Autowired 
	private EstateReviewService estateReviewService;
	
	//삭제
	@RequestMapping("/estateReview/delete.es")
	public String esReviewDelete(@RequestParam("esReNo")int esReNo,Model model, HttpSession session) {
		
		int result = estateReviewService.esReviewDelete(esReNo);
		
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
		
		
		System.out.println("번호가 넘어오나요????" + esReNo);		
		System.out.println("별점: " + esReScore);
		System.out.println("내용: " + esReContent);
		    
		int result = estateReviewService.updateReview(esReNo,esReScore,esReContent);
		
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
	
	
}
