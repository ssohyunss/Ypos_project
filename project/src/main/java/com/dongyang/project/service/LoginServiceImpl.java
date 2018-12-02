package com.dongyang.project.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dongyang.project.dao.MainDao;
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

@Service
public class LoginServiceImpl implements LoginService{
	@Inject
	private MainDao dao;
	
	@Override
	public LoginVO select(String mid) throws Exception{
		return dao.select(mid);
	}
	@Override
	public int insert(LoginVO vo) throws Exception{
		return dao.insert(vo);
	}
	@Override
	public int insertImage(ImageVO vo) throws Exception{
		return dao.insertImage(vo);
	}
	@Override
	public List<ProductVO> selectProduct(String site) throws Exception{
		return dao.selectProduct(site);
	}
	@Override
	public ImageVO selectImage(String id) throws Exception{
		return dao.selectImage(id);
	}
	@Override
	public ProductVO nextTid() throws Exception{
		return dao.nextTid();
	}
	@Override
	public int insertPro(ProductVO vo) throws Exception{
		return dao.insertPro(vo);
	}
	@Override
	public ProductVO selectProductInfo(String barcode) throws Exception{
		return dao.selectProductInfo(barcode);
	}
	@Override
	public ProductVO selectProductInfo(HashMap<String,Object> map) throws Exception{
		return dao.selectProductInfo(map);
	}
	@Override
	public int updateProductIn(ProductVO vo) throws Exception{
		return dao.updateProductIn(vo);
	}
	@Override
	public int updateProductOut(ProductVO vo) throws Exception{
		return dao.updateProductOut(vo);
	}
	@Override
	public List<ProductVO> searchProduct(HashMap<String,Object> map) throws Exception{
		return dao.searchProduct(map);
	}
	@Override
	public List<OrderVO> selectOrder(String site) throws Exception{
		return dao.selectOrder(site);
	}
	@Override
	public List<OrderVO> selectOrderSite(HashMap<String, Object> map) throws Exception{
		return dao.selectOrderSite(map);
	}
	@Override
	public List<ReturnVO> selectReturn(String site) throws Exception {
		return dao.selectReturn(site);
	}
	@Override
	public int insertOrder(HashMap<String, Object> map) {
		return dao.insertOrder(map);
	}
	@Override
	public int insertReturn(HashMap<String, Object> map) {
		return dao.insertReturn(map);
	}
	@Override
	public List<CommunityVO> selectCommunity() {
		return dao.selectCommunity();
	}
	@Override
	public CommunityVO selectCommunity(String tid) {
		return dao.selectCommunity(tid);
	}
	@Override
	public int insertCommunity(HashMap<String, Object> map) {
		return dao.insertCommunity(map);
	}
	@Override
	public int deleteCommunity(String tid) {
		return dao.deleteCommunity(tid);
	}
	@Override
	public int modifyCommunity(HashMap<String, Object> map) {
		return dao.modifyCommunity(map);
	}
	@Override
	public List<NoticeVO> selectNotice() {
		return dao.selectNotice();
	}
	@Override
	public NoticeVO selectNotice(String tid) {
		return dao.selectNotice(tid);
	}
	@Override
	public int insertNotice(HashMap<String, Object> map) {
		return dao.insertNotice(map);
	}
	@Override
	public int deleteNotice(String tid) {
		return dao.deleteNotice(tid);
	}
	@Override
	public int modifyNotice(HashMap<String, Object> map) {
		return dao.modifyNotice(map);
	}
	@Override
	public List<SiteVO> selectSite(String site) {
		return dao.selectSite(site);
	}
	@Override
	public int updateOrder(HashMap<String, Object> map) {
		return dao.updateOrder(map);
	}
	@Override
	public List<OrderVO> selectOrderInput(String site) throws Exception {
		return dao.selectOrderInput(site);
	}
	@Override
	public int insertLog(HashMap<String, Object> map) {
		return dao.insertLog(map);
	}
	@Override
	public List<InOutVO> selectInOut(HashMap<String, Object> map) {
		return dao.selectInOut(map);
	}
	@Override
	public String selectSaleCount(HashMap<String, Object> map) {
		return dao.selectSaleCount(map);
	}
	@Override
	public int insertSale(HashMap<String, Object> map) {
		return dao.insertSale(map);
	}
	@Override
	public int updateProduct(HashMap<String, Object> map) {
		return dao.updateProduct(map);
	}
	@Override
	public String selectSaleCountReturn(HashMap<String, Object> map) {
		return dao.selectSaleCountReturn(map);
	}
	@Override
	public String selectSaleMoney(HashMap<String, Object> map) {
		return dao.selectSaleMoney(map);
	}
	@Override
	public String selectSaleReturnMoney(HashMap<String, Object> map) {
		return dao.selectSaleReturnMoney(map);
	}
	@Override
	public List<SaleVO> selectSaleList(HashMap<String, Object> map) {
		return dao.selectSaleList(map);
	}
}
