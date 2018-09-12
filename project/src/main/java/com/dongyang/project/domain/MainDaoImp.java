package com.dongyang.project.domain;

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
}
