package com.kh.dungjip.enquiry.controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dungjip.enquiry.model.service.EnquiryService;
import com.kh.dungjip.enquiry.model.vo.Enquiry;

@Controller
public class EnquiryController {
	@Autowired
	private EnquiryService enquiryService;
	
	//문의하기 메인 (1:1문의)
	@RequestMapping("enquiry.en")
	public String enquiryMain() {
		return "enquiry/enquiryMain";
	}
	
	//1:1문의 등록
	@RequestMapping("insert.en")
	public String insertEnquiry(Enquiry en
							   ,MultipartFile enfile
							   ,HttpSession session) {
		
		System.out.println(en);
		int result = enquiryService.insertEnquiry(en);
		System.out.println(result);
		if(!enfile.getOriginalFilename().equals("")){
			String originName = enfile.getOriginalFilename();
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random()*90000+10000);
			String ext = originName.substring(originName.lastIndexOf("."));
		})
		if(result>0) {
			session.setAttribute("alertMsg", "문의하기 등록 성공");
			return "redirect:enquiry.en";
		}else {
			session.setAttribute("alertMsg", "문의하기 등록 실패");
			return "redirect:enquiry.en";
		}
	}
}
