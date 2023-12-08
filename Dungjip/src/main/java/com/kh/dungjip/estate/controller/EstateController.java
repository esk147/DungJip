package com.kh.dungjip.estate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EstateController {

	@RequestMapping("detail.es")
	public String estateDetail() {
		return "estate/estateDetail";
	}
}
