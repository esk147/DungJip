package com.kh.dungjip.estate.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dungjip.estate.model.service.EstateService;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.member.model.vo.Member;

@Controller
public class EstateController {

	@Autowired
	private EstateService estateService;
	
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
	
}
