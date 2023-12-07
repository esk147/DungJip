package com.kh.dungjip.jjim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.dungjip.jjim.model.server.JjimService;

@Controller
public class JjimController {
	
	@Autowired
	private JjimService JjimService;

	
}
