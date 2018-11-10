package com.dongyang.project.dao;

import java.util.HashMap;
import java.util.List;

import com.dongyang.project.domain.CommunityVO;
import com.dongyang.project.domain.ImageVO;
import com.dongyang.project.domain.LoginVO;
import com.dongyang.project.domain.OrderVO;
import com.dongyang.project.domain.ProductVO;
import com.dongyang.project.domain.ReturnVO;

public interface MainDao {
	public LoginVO select(String mid) throws Exception;
	public int insert(LoginVO vo) throws Exception;
	public int insertImage(ImageVO vo) throws Exception;
	public List<ProductVO> selectProduct() throws Exception;
	public ImageVO selectImage(String id) throws Exception;
	public ProductVO nextTid() throws Exception;
	public int insertPro(ProductVO vo) throws Exception;
	public ProductVO selectProductInfo(String barcode) throws Exception;
	public int updateProductIn(ProductVO vo) throws Exception;
	public int updateProductOut(ProductVO vo) throws Exception;
	public List<ProductVO> searchProduct(HashMap<String,Object> map) throws Exception;
	public List<OrderVO> selectOrder(String site) throws Exception;
	public List<ReturnVO> selectReturn(String site) throws Exception;
	public int insertOrder(HashMap<String, Object> map);
	public int insertReturn(HashMap<String, Object> map);
	public List<CommunityVO> selectCommunity();
	public CommunityVO selectCommunity(String tid);
	public int insertCommunity(HashMap<String, Object> map);
	public int deleteCommunity(String tid);
	public int modifyCommunity(HashMap<String, Object> map);
}
