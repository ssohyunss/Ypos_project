package com.dongyang.project.dao;

import java.util.HashMap;
import java.util.List;

import com.dongyang.project.domain.CommunityVO;
import com.dongyang.project.domain.ImageVO;
import com.dongyang.project.domain.InOutVO;
import com.dongyang.project.domain.LoginVO;
import com.dongyang.project.domain.NoticeVO;
import com.dongyang.project.domain.OrderVO;
import com.dongyang.project.domain.ProductVO;
import com.dongyang.project.domain.ReturnVO;
import com.dongyang.project.domain.SaleVO;
import com.dongyang.project.domain.SiteVO;

public interface MainDao {
	public LoginVO select(String mid) throws Exception;
	public int insert(LoginVO vo) throws Exception;
	public int insertImage(ImageVO vo) throws Exception;
	public List<ProductVO> selectProduct(String site) throws Exception;
	public ImageVO selectImage(String id) throws Exception;
	public ProductVO nextTid() throws Exception;
	public int insertPro(ProductVO vo) throws Exception;
	public ProductVO selectProductInfo(String barcode) throws Exception;
	public ProductVO selectProductInfo(HashMap<String, Object> map) throws Exception;
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
	public List<NoticeVO> selectNotice();
	public NoticeVO selectNotice(String tid);
	public int insertNotice(HashMap<String, Object> map);
	public int deleteNotice(String tid);
	public int modifyNotice(HashMap<String, Object> map);
	public List<SiteVO> selectSite(String site);
	public List<OrderVO> selectOrderSite(HashMap<String, Object> map) throws Exception;
	public int updateOrder(HashMap<String, Object> map);
	public List<OrderVO> selectOrderInput(HashMap<String, Object> map) throws Exception;
	public int insertLog(HashMap<String, Object> map);
	public List<InOutVO> selectInOut(HashMap<String, Object> map);
	public String selectSaleCount(HashMap<String, Object> map);
	public int insertSale(HashMap<String, Object> map);
	public int updateProduct(HashMap<String, Object> map);
	public String selectSaleCountReturn(HashMap<String, Object> map);
	public String selectSaleMoney(HashMap<String, Object> map);
	public String selectSaleReturnMoney(HashMap<String, Object> map);
	public List<SaleVO> selectSaleList(HashMap<String, Object> map);
	public String searchProductName(HashMap<String, Object> map);
}
