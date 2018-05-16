package com.example.spring01.controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring01.model.dto.ProductDTO;


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
	
	@RequestMapping("test.do")
	public void test() {
		//method name과 같은 페이지로 이동
		
		//return "test";
	}
	
	@RequestMapping("test/doA") 
		public String doA(Model model) {
		//자료저장
			model.addAttribute("message","홈페이지 방문을 환영합니다.");
			//포워딩
			return "test/doA";
	}
	
	@RequestMapping("test/doB")
	public void doB() {
		//리턴타입이 void인 경우 url name ("test/doB") 와 같은 페이지로 포워딩

	logger.info("doB 호출...");
	
	}
	
	//Model - 전달할 데이터
	//ModelAndView - 데이터와 포워딩 할 페이지 정보 포함
	
	@RequestMapping("test/doC")
	public ModelAndView doC() {
		Map<String,Object> map = new HashMap<>();
		
		map.put("product",new ProductDTO("샤프",1000));
		
		return new ModelAndView("test/doC","map",map);
		
	}
	
	@RequestMapping("test/doD")
	
	public String doD() {
		
		return "redirect:/test/doE";
	
	}
	
	@RequestMapping("test/doE") //doE.jsp 포워딩
	public void doE() {
		
	}
	
	//첫번째 방법
	//view를 리턴하는것이 아니라 데이터 자체를 리턴
	//@ResponseBody //DTO를 json으로 변환
	//@RequestMapping("test/doF")
	//public ProductDTO doF() {
	//	return new ProductDTO("냉장고",5000000);
	//}
	//두번째 방법 -> SampleRestController

}
