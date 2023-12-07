package com.kh.dungjip.house.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HouseDetailController {

	@RequestMapping("detail.ho")
	public String houseDetail(){		
		return "house/houseDetail";
	}
}
