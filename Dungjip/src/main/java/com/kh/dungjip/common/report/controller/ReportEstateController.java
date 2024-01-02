package com.kh.dungjip.common.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dungjip.common.report.model.service.ReportEstateService;
import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;

@Controller
@RequestMapping("/admin")
public class ReportEstateController {
	
	@Autowired
	private ReportEstateService reportEstateService;

	@GetMapping("/reportList") 
	public String selectReportList(Model model) {
		List<ReportEstate> reportList = reportEstateService.selectReportList();
		
		System.out.println(reportList);
		
		model.addAttribute("reportList", reportList);
		
		return "websocket/reportListView";
	}
	
    @GetMapping("/chatHistory")
    public List<ChatMessage> selectChatHistory(@RequestParam int chatRoomNo) {
        return reportEstateService.selectChatHistory(chatRoomNo);
    }
	
}