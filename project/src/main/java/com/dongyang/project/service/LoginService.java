package com.dongyang.project.service;

import java.util.HashMap;
import java.util.List;

import com.dongyang.project.domain.CommunityVO;
import com.dongyang.project.domain.ImageVO;
import com.dongyang.project.domain.LoginVO;
import com.dongyang.project.domain.NoticeVO;
import com.dongyang.project.domain.OrderVO;
import com.dongyang.project.domain.ProductVO;
import com.dongyang.project.domain.ReturnVO;
import com.dongyang.project.domain.SiteVO;

public interface LoginService {
	public LoginVO select(String mid) throws Exception;
	public int insert(LoginVO vo) throws Exception;
	public int insertImage(ImageVO vo) throws Exception;
	
	public ImageVO selectImage(String id) throws Exception;
	public ProductVO nextTid() throws Exception;
	public int insertPro(ProductVO vo) throws Exception;
	public ProductVO selectProductInfo(String barcode) throws Exception;
	public int updateProductIn(ProductVO vo) throws Exception;
	public int updateProductOut(ProductVO vo) throws Exception;
	//재고현황
	public List<ProductVO> selectProduct() throws Exception;
	public List<ProductVO> searchProduct(HashMap<String,Object> map) throws Exception;
	
	//주문 등록현황
	public List<OrderVO> selectOrder(String site) throws Exception;
	public List<ReturnVO> selectReturn(String site) throws Exception;
	public int insertOrder(HashMap<String, Object> map);
	public int insertReturn(HashMap<String, Object> map);
	public List<CommunityVO> selectCommunity();
	public CommunityVO selectCommunity(String tid);
	public int insertCommunity(HashMap<String, Object> map);
	public int deleteCommunity(String tid);
	public int modifyCommunity(HashMap<String, Object> map);
	
	public List<NoticeVO> selectNotice();
	public NoticeVO selectNotice(String tid);
	public int insertNotice(HashMap<String, Object> map);
	public int deleteNotice(String tid);
	public int modifyNotice(HashMap<String, Object> map);
	public List<SiteVO> selectSite(String site);
	public List<OrderVO> selectOrderSite(HashMap<String, Object> map) throws Exception;
	public int updateOrder(HashMap<String, Object> map);
	public List<OrderVO> selectOrderInput(String site) throws Exception;
}
