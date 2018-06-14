package com.dongyang.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dongyang.project.domain.LoginVO;
import com.dongyang.project.service.LoginService;

@Controller
public class MainController {
	
private static final Logger logger = LoggerFactory.getLogger(MainController.class);
@Inject
private LoginService service;

	//url mapping
	@RequestMapping("/")
	public String login(HttpServletRequest request) {
		return "login";
	}
	@RequestMapping(value="/select",method = RequestMethod.POST)
	public String selectPOST(HttpServletRequest request,LoginVO login, Model model) throws Exception{
		JSONObject obj = new JSONObject();
		obj.put("loginYN", "N");
		request.setAttribute("jsonOut", obj);
		LoginVO bean = service.select((String)request.getParameter("mid"));
		HttpSession session = request.getSession();
		if(null != bean) {
			if(request.getParameter("mpw").equals(bean.getMpw())) {
				obj.put("loginYN", "Y");
				session.setAttribute("name", bean.getName());
			}else{
				obj.put("loginYN", "N");
			}
		}else {
			obj.put("loginYN", "N");
		}
		return "stringout";
	}
	@RequestMapping("/main.do")
	public String main(Model model) {
		model.addAttribute("message","메인화면");
		return "main";
	}
	
	@RequestMapping("/sale.do")
	public String sale(Model model) {
		model.addAttribute("message","판매관리");
		return "sale";
	}
	
	@RequestMapping("sale/regist")
	public String regist(Model model) {
		model.addAttribute("message","판매등록");
		return "sale/regist";
	}
	
	@RequestMapping("sale/deadline")
	public String deadline(Model model) {
		model.addAttribute("message","판매마감현황");
		
		return "sale/deadline";
	}
	
	@RequestMapping("sale/status")
	public String status(Model model) {
		model.addAttribute("message","품번별판매현황");
		
		return "sale/status";
	}
	
	@RequestMapping("sale/graph")
	public String graph(Model model) {
		model.addAttribute("message","월별그래프");
		
		return "sale/graph";
		
	}
	
	@RequestMapping("/manage.do")
	public String manage(Model model) {
		model.addAttribute("message","재고관리");
		return "manage";
	}
	
	@RequestMapping("manage/otherStore")
	public String otherStore(Model model) {
		model.addAttribute("message","타매장재고현황");
		
		return "manage/otherStore";
	}
	
	@RequestMapping("manage/store")
	public String store(Model model) {
		model.addAttribute("message","매장재고현황");
		
		return "manage/store";
	}
	
	@RequestMapping("manage/proStatus")
	public String proStatus(Model model) {
		model.addAttribute("message","품번별수불현황");
		
		return "manage/proStatus";
	}
	
	@RequestMapping("manage/dateStatus")
	public String dateStatus(Model model) {
		model.addAttribute("message","일자별수불현황");
		
		return "manage/dateStatus";
	}
	
	@RequestMapping("/inout.do")
	public String inout(Model model) {
		model.addAttribute("message","입/출고관리");
		return "inout";
	}
	
	@RequestMapping("inout/orderRegist")
	public String orderRegist(Model model) {
		model.addAttribute("message","주문등록");
		
		return "inout/orderRegist";
	}
	
	@RequestMapping("inout/orderStatus")
	public String orderStatus(Model model) {
		model.addAttribute("message","주문현황");
		
		return "inout/orderStatus";
	}
	
	@RequestMapping("inout/confirm")
	public String confirm(Model model) {
		model.addAttribute("message","입점확인");
		
		return "inout/confirm";
	}
	
	@RequestMapping("inout/returnRegist")
	public String returnRegist(Model model) {
		model.addAttribute("message","반품등록");
		
		return "inout/returnRegist";
	}
	
	@RequestMapping("inout/returnStatus")
	public String returnStatus(Model model) {
		model.addAttribute("message","반품현황");
		
		return "inout/returnStatus";
	}
	@RequestMapping("/commu.do")
	public String commu(Model model) {
		model.addAttribute("message","커뮤니티");
		return "commu";
	}
}
