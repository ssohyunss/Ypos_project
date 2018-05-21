package com.dongyang.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//url mapping
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("message","홈페이지 방문을 환영합니다.");
		
		return "main";
	}

}
