package com.dongyang.project.domain;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dongyang.project.dao.MainDao;
@Repository
public class MainDaoImp implements MainDao{
	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.dongyang.project.loginMapper";
	
	@Override
	public LoginVO select(String mid) throws Exception{
		return sqlSession.selectOne(namespace+".selectManager", mid);
	}
	@Override
	public int insert(LoginVO vo) throws Exception{
		return sqlSession.insert(namespace+".insertManager",vo);
	}
	@Override
	public int insertImage(ImageVO vo) throws Exception{
		return sqlSession.insert(namespace+".insertImageManager",vo);
	}
	@Override
	public List<ProductVO> selectProduct(String site) throws Exception{
		return sqlSession.selectList(namespace+".selectProduct", site);
	}
	@Override
	public ImageVO selectImage(String id) throws Exception{
		return sqlSession.selectOne(namespace+".selectImage",id);
	}
	@Override
	public ProductVO nextTid() throws Exception{
		return sqlSession.selectOne(namespace+".nextTidManager");
	}
	public int insertPro(ProductVO vo) throws Exception{
		return sqlSession.insert(namespace+".insertPro",vo);
	}
	@Override
	public ProductVO selectProductInfo(String barcode) throws Exception{
		return sqlSession.selectOne(namespace+".selectProductInfo",barcode);
	}
	@Override
	public ProductVO selectProductInfo(HashMap<String,Object> map) throws Exception{
		return sqlSession.selectOne(namespace+".selectProductInfoMap",map);
	}
	@Override
	public int updateProductIn(ProductVO vo) throws Exception{
		return sqlSession.update(namespace+".updateProductIn",vo);
	}
	@Override
	public int updateProductOut(ProductVO vo) throws Exception{
		return sqlSession.update(namespace+".updateProductOut",vo);
	}
	public List<ProductVO> searchProduct(HashMap<String,Object> map) throws Exception {
		return sqlSession.selectList(namespace+".searchProduct",map);
	}
	@Override
	public List<OrderVO> selectOrder(String site) throws Exception {
		return sqlSession.selectList(namespace+".selectOrder", site);
	}
	@Override
	public List<OrderVO> selectOrderSite(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(namespace+".selectOrderSite", map);
	}
	@Override
	public List<ReturnVO> selectReturn(String site) throws Exception {
		return sqlSession.selectList(namespace+".selectReturn", site);
	}
	@Override
	public int insertOrder(HashMap<String, Object> map) {
		return sqlSession.insert(namespace+".insertOrder", map);
	}	
	@Override
	public int insertReturn(HashMap<String, Object> map) {
		return sqlSession.insert(namespace+".insertReturn", map);
	}
	@Override
	public List<CommunityVO> selectCommunity() {
		return sqlSession.selectList(namespace+".selectCommunity");
	}
	@Override
	public CommunityVO selectCommunity(String tid) {
		return sqlSession.selectOne(namespace+".selectCommunityBean", tid);
	}
	@Override
	public int insertCommunity(HashMap<String, Object> map) {
		return sqlSession.insert(namespace+".insertCommunity", map);
	}	
	@Override
	public int deleteCommunity(String tid) {
		return sqlSession.insert(namespace+".deleteCommunity", tid);
	}
	@Override
	public int modifyCommunity(HashMap<String, Object> map) {
		return sqlSession.insert(namespace+".modifyCommunity", map);
	}
	@Override
	public List<NoticeVO> selectNotice() {
		return sqlSession.selectList(namespace+".selectNotice");
	}
	@Override
	public NoticeVO selectNotice(String tid) {
		return sqlSession.selectOne(namespace+".selectNoticeBean", tid);
	}
	@Override
	public int insertNotice(HashMap<String, Object> map) {
		return sqlSession.insert(namespace+".insertNotice", map);
	}	
	@Override
	public int deleteNotice(String tid) {
		return sqlSession.insert(namespace+".deleteNotice", tid);
	}
	@Override
	public int modifyNotice(HashMap<String, Object> map) {
		return sqlSession.insert(namespace+".modifyNotice", map);
	}
	@Override
	public List<SiteVO> selectSite(String site) {
		return sqlSession.selectList(namespace+".selectSite", site);
	}
	@Override
	public int updateOrder(HashMap<String, Object> map) {
		return sqlSession.update(namespace+".updateOrder",map);
	}
	@Override
	public List<OrderVO> selectOrderInput(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(namespace+".selectOrderInput", map);
	}
	@Override
	public int insertLog(HashMap<String, Object> map) {
		return sqlSession.insert(namespace+".insertLog", map);
	}
	@Override
	public List<InOutVO> selectInOut(HashMap<String, Object> map) {
		return sqlSession.selectList(namespace+".selectInOut", map);
	}
	@Override
	public String selectSaleCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(namespace+".selectSaleCount", map);
	}
	@Override
	public int insertSale(HashMap<String, Object> map) {
		return sqlSession.insert(namespace+".insertSale", map);
	}
	@Override
	public int updateProduct(HashMap<String, Object> map) {
		return sqlSession.update(namespace+".updateProduct",map);
	}
	@Override
	public String selectSaleCountReturn(HashMap<String, Object> map) {
		return sqlSession.selectOne(namespace+".selectSaleCountReturn", map);
	}
	@Override
	public String selectSaleMoney(HashMap<String, Object> map) {
		return sqlSession.selectOne(namespace+".selectSaleMoney", map);
	}
	@Override
	public String selectSaleReturnMoney(HashMap<String, Object> map) {
		return sqlSession.selectOne(namespace+".selectSaleReturnMoney", map);
	}
	@Override
	public List<SaleVO> selectSaleList(HashMap<String, Object> map) {
		return sqlSession.selectList(namespace+".selectSaleList", map);
	}
	@Override
	public String searchProductName(HashMap<String, Object> map) {
		return sqlSession.selectOne(namespace+".searchProductName", map);
	}
	
}
