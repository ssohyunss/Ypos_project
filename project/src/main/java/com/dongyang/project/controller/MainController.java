package com.dongyang.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dongyang.project.domain.CommunityVO;
import com.dongyang.project.domain.LoginVO;
import com.dongyang.project.domain.NoticeVO;
import com.dongyang.project.domain.OrderVO;
import com.dongyang.project.domain.ProductVO;
import com.dongyang.project.domain.ReturnVO;
import com.dongyang.project.service.LoginService;

@Controller
public class MainController {
public static Locale default_locale = Locale.getDefault();
public static SimpleDateFormat default_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", default_locale);
@Inject
private LoginService service;
	//url mapping
	@RequestMapping("/")
	public String login(HttpServletRequest request) {
		return "login";
	}
	@RequestMapping(value="/select",method = RequestMethod.POST)
	public String selectPOST(HttpServletRequest request,LoginVO login, Model model, HttpSession session) throws Exception{
		JSONObject obj = new JSONObject();
		obj.put("loginYN", "N");
		LoginVO bean = service.select((String)request.getParameter("mid"));
		if(null != bean) {
			if(request.getParameter("mpw").equals(bean.getMpw())) {
				obj.put("loginYN", "Y");
				session.setAttribute("userTid", bean.getTid());
				session.setAttribute("site", bean.getSite_tid());
				session.setAttribute("userName", bean.getName());
			}else{
				obj.put("loginYN", "N");
			}
		}else {
			obj.put("loginYN", "N");
		}
		request.setAttribute("jsonOut", obj);
		return "stringout";
	}
	@RequestMapping(value="/main.do", method = RequestMethod.POST)
	public String main(HttpServletRequest request,Model model, HttpSession session, NoticeVO vo) throws Exception {
		List<NoticeVO> list = service.selectNotice();
		if(null == list) {
			list = new ArrayList<NoticeVO>(); 
		}
		request.setAttribute("list",list);
		return "main";
	}
	
	@RequestMapping("/sale_regist.do")
	public String sale_regist(Model model) {
		model.addAttribute("message","판매등록");
		return "sale_regist";
	}
	
	@RequestMapping("/sale_deadline.do")
	public String sale_deadline(Model model) {
		model.addAttribute("message","판매마감현황");
		return "sale_deadline";
	}
	
	
	@RequestMapping("/sale_pro_manage.do")
	public String sale_pro_manage(Model model) {
		model.addAttribute("message","상품코드별 판매현황");
		return "sale_pro_manage";
	}
	


	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/manage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String manage(HttpServletRequest request,ProductVO vo, Model model, HttpSession session) throws Exception {
		List<ProductVO> list = new ArrayList<ProductVO>();
		if(null != (String)request.getParameter("searchText")) {
			@SuppressWarnings("rawtypes")
			HashMap<String,Object> map = new HashMap();
			map.put("type", (String)request.getParameter("type"));
			map.put("keyword", (String)request.getParameter("searchText"));
			map.put("site", (String)session.getAttribute("site"));
			list = service.searchProduct(map);
		}else {
			list = service.selectProduct();
		}
		if(null == list) {
			list = new ArrayList<ProductVO>(); 
		}
		request.setAttribute("list",list);
		return "manage";
	}
	
	@RequestMapping("/other_manage.do")
	public String otherStore(Model model) {
		model.addAttribute("message","타매장재고현황");
		
		return "other_manage";
	}
	
	@RequestMapping("/product_manage.do")
	public String product_manage(Model model) {
		model.addAttribute("message","상품코드별 수불현황");
		
		return "product_manage";
	}
	
	@RequestMapping("/date_manage.do")
	public String date_manage(Model model) {
		model.addAttribute("message","일자별 수불현황");
		
		return "date_manage";
	}
	
	
	@RequestMapping("manage/store")
	public String store(HttpServletRequest request,Model model) throws Exception {
		List<ProductVO> list = service.selectProduct();
		if(null == list) {
			list = new ArrayList<ProductVO>(); 
		}
		request.setAttribute("list",list);
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
	
	@RequestMapping("/order_manage_inout.do")
	public String order(HttpServletRequest request, OrderVO vo, Model model, HttpSession session) throws Exception {
		String site = (String)session.getAttribute("site");
		List<OrderVO> list = service.selectOrder(site);
		if(null == list) {
			list = new ArrayList<OrderVO>(); 
		}
		List<ProductVO> productList = service.selectProduct();
		if(null == productList) {
			productList = new ArrayList<ProductVO>(); 
		}
		request.setAttribute("list",list);
		request.setAttribute("productList",productList);
		return "order_manage_inout";
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/insertOrder")
	public String insertOrder(HttpServletRequest request, OrderVO vo, Model model, HttpSession session) throws Exception {
		JSONObject obj = new JSONObject();
		int result = 0;
		obj.put("successYN", "N");
		HashMap<String,Object> map = new HashMap();
		map.put("site", (String)session.getAttribute("site"));
		map.put("orderName", (String)request.getParameter("orderName"));
		map.put("orderCode", (String)request.getParameter("orderCode"));
		map.put("orderCount", (String)request.getParameter("orderCount"));
		map.put("orderDesc", (String)request.getParameter("orderDesc"));
		map.put("order", (String)request.getParameter("order"));
		map.put("date", default_format.format(new Date()));
		result = service.insertOrder(map);
		if(0 < result) {
			obj.put("successYN", "Y");
		}
		request.setAttribute("jsonOut", obj);
		return "stringout";
	}
	@RequestMapping("/return_manage_inout.do")
	public String return_inout (HttpServletRequest request, ReturnVO vo, Model model, HttpSession session) throws Exception {
		String site = (String)session.getAttribute("site");
		List<ReturnVO> list = service.selectReturn(site);
		if(null == list) {
			list = new ArrayList<ReturnVO>(); 
		}
		List<ProductVO> productList = service.selectProduct();
		if(null == productList) {
			productList = new ArrayList<ProductVO>(); 
		}
		request.setAttribute("list",list);
		request.setAttribute("productList",productList);
		return "return_manage_inout";
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/insertReturn")
	public String insertReturn (HttpServletRequest request, ReturnVO vo, Model model, HttpSession session) throws Exception {
		JSONObject obj = new JSONObject();
		int result = 0;
		obj.put("successYN", "N");
		HashMap<String,Object> map = new HashMap();
		map.put("site", (String)session.getAttribute("site"));
		map.put("returnName", (String)request.getParameter("returnName"));
		map.put("returnCode", (String)request.getParameter("returnCode"));
		map.put("returnCount", (String)request.getParameter("returnCount"));
		map.put("returnReason", (String)request.getParameter("returnReason"));
		map.put("date", default_format.format(new Date()));
		result = service.insertReturn(map);
		if(0 < result) {
			obj.put("successYN", "Y");
		}
		request.setAttribute("jsonOut", obj);
		return "stringout";
	}
	
	@RequestMapping("/order_input_confirm.do")
	public String order_input_confirm(Model model) {
		model.addAttribute("message","입점확인");
		return "order_input_confirm";
	}
	
	@RequestMapping("/order_output_history.do")
	public String order_output_history(Model model) {
		model.addAttribute("message","출고주문내역");
		return "order_output_history";
	}
	
	
	@RequestMapping("/notice_commu.do")
	public String notice_commu (HttpServletRequest request, NoticeVO vo, Model model, HttpSession session) {
		List<NoticeVO> list = service.selectNotice();
		if(null == list) {
			list = new ArrayList<NoticeVO>(); 
		}
		request.setAttribute("list",list);
		return "notice_commu";
	}
	@RequestMapping("/notice_write_commu.do")
	public String notice_write_commu (HttpServletRequest request, CommunityVO vo, Model model, HttpSession session) {
		NoticeVO bean = new NoticeVO();
		if(null != (String)request.getParameter("tid")) {
			bean = service.selectNotice((String)request.getParameter("tid"));
		}
		request.setAttribute("bean",bean);
		return "notice_write_commu";
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/insertNotice")
	public String insertNotice (HttpServletRequest request, NoticeVO vo, Model model, HttpSession session) throws JSONException {
		JSONObject obj = new JSONObject();
		int result = 0;
		obj.put("successYN", "N");
		HashMap<String,Object> map = new HashMap();
		map.put("site", (String)session.getAttribute("site"));
		map.put("userTid", (String)session.getAttribute("userTid"));
		map.put("title", (String)request.getParameter("title"));
		map.put("contents", (String)request.getParameter("contents"));
		map.put("date", default_format.format(new Date()));
		result = service.insertNotice(map);
		if(0 < result) {
			obj.put("successYN", "Y");
		}
		request.setAttribute("jsonOut", obj);
		return "stringout";
	}
	
	@RequestMapping("/notice_commu_view.do")
	public String notice_commu_view (HttpServletRequest request, NoticeVO vo, Model model, HttpSession session) {
		NoticeVO bean = new NoticeVO();
		if(null != (String)request.getParameter("tid")) {
			bean = service.selectNotice((String)request.getParameter("tid"));
		}
		request.setAttribute("bean",bean);
		return "notice_commu_view";
	}
	@RequestMapping("/deleteNotice")
	public String deleteCommunity (HttpServletRequest request, NoticeVO vo, Model model, HttpSession session) {
		int result = service.deleteNotice((String)request.getParameter("tid"));
		return notice_commu(request, vo, model, session);
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/modifyNotice")
	public String modifyNotice (HttpServletRequest request, NoticeVO vo, Model model, HttpSession session) throws JSONException {
		JSONObject obj = new JSONObject();
		int result = 0;
		obj.put("successYN", "N");
		HashMap<String,Object> map = new HashMap();
		map.put("title", (String)request.getParameter("title"));
		map.put("contents", (String)request.getParameter("contents"));
		map.put("tid", (String)request.getParameter("tid"));
		map.put("date", default_format.format(new Date()));
		result = service.modifyNotice(map);
		if(0 < result) {
			obj.put("successYN", "Y");
		}
		request.setAttribute("jsonOut", obj);
		return "stringout";
	}
	
	@RequestMapping("/free_commu.do")
	public String free_commu (HttpServletRequest request, CommunityVO vo, Model model, HttpSession session) {
		List<CommunityVO> list = service.selectCommunity();
		if(null == list) {
			list = new ArrayList<CommunityVO>(); 
		}
		request.setAttribute("list",list);
		return "free_commu";
	}
	
	@RequestMapping("/free_write_commu.do")
	public String free_write_commu (HttpServletRequest request, CommunityVO vo, Model model, HttpSession session) {
		CommunityVO bean = new CommunityVO();
		if(null != (String)request.getParameter("tid")) {
			bean = service.selectCommunity((String)request.getParameter("tid"));
		}
		request.setAttribute("bean",bean);
		return "free_write_commu";
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/insertCommunity")
	public String insertCommunity (HttpServletRequest request, CommunityVO vo, Model model, HttpSession session) throws JSONException {
		JSONObject obj = new JSONObject();
		int result = 0;
		obj.put("successYN", "N");
		HashMap<String,Object> map = new HashMap();
		map.put("site", (String)session.getAttribute("site"));
		map.put("userTid", (String)session.getAttribute("userTid"));
		map.put("title", (String)request.getParameter("title"));
		map.put("contents", (String)request.getParameter("contents"));
		map.put("date", default_format.format(new Date()));
		result = service.insertCommunity(map);
		if(0 < result) {
			obj.put("successYN", "Y");
		}
		request.setAttribute("jsonOut", obj);
		return "stringout";
	}
	@RequestMapping("/free_commu_view.do")
	public String free_commu_view (HttpServletRequest request, CommunityVO vo, Model model, HttpSession session) {
		CommunityVO bean = new CommunityVO();
		if(null != (String)request.getParameter("tid")) {
			bean = service.selectCommunity((String)request.getParameter("tid"));
		}
		request.setAttribute("bean",bean);
		return "free_commu_view";
	}
	@RequestMapping("/deleteCommunity")
	public String deleteCommunity (HttpServletRequest request, CommunityVO vo, Model model, HttpSession session) {
		int result = service.deleteCommunity((String)request.getParameter("tid"));
		return free_commu(request, vo, model, session);
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/modifyCommunity")
	public String modifyCommunity (HttpServletRequest request, CommunityVO vo, Model model, HttpSession session) throws JSONException {
		JSONObject obj = new JSONObject();
		int result = 0;
		obj.put("successYN", "N");
		HashMap<String,Object> map = new HashMap();
		map.put("title", (String)request.getParameter("title"));
		map.put("contents", (String)request.getParameter("contents"));
		map.put("tid", (String)request.getParameter("tid"));
		map.put("date", default_format.format(new Date()));
		result = service.modifyCommunity(map);
		if(0 < result) {
			obj.put("successYN", "Y");
		}
		request.setAttribute("jsonOut", obj);
		return "stringout";
	}
}
