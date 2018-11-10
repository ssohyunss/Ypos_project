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
	public List<ProductVO> selectProduct() throws Exception{
		return sqlSession.selectList(namespace+".selectProduct");
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
}
