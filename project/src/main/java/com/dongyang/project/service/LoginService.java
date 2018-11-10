package com.dongyang.project.service;

import java.util.HashMap;
import java.util.List;

import com.dongyang.project.domain.ImageVO;
import com.dongyang.project.domain.LoginVO;
import com.dongyang.project.domain.OrderVO;
import com.dongyang.project.domain.ProductVO;
import com.dongyang.project.domain.ReturnVO;

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
}
