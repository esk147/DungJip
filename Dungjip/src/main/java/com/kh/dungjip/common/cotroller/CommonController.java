package com.kh.dungjip.common.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	
	@GetMapping("subscribe.sb")
	public String subscribePage() {
		
		return "subscribe/subscribeView";
	}
	
}
