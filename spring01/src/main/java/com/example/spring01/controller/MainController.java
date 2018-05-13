package com.example.spring01.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//url mapping
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("message","홈페이지 방문을 환영합니다.");
		
		return "main";
	}
	
	@RequestMapping("gugu.do") //url mapping
	public String gugu(Model model ,@RequestParam(defaultValue="2") int dan) {
		
		//int dan = 7;
		String result="";
		for(int i=1; i<=9; i++) {
			result +=dan + "X" + i + "=" + dan*i + "<br>";
		}
		
		model.addAttribute("result",result);
		
		return "test/gugu"; //views/test/gugu.jsp로 포워딩
	}
}
