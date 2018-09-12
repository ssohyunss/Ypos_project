package com.dongyang.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dongyang.project.dao.MainDao;
import com.dongyang.project.domain.ImageVO;
import com.dongyang.project.domain.LoginVO;
import com.dongyang.project.domain.ProductVO;

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
	public List<ProductVO> selectProduct() throws Exception{
		return dao.selectProduct();
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
	public int updateProductIn(ProductVO vo) throws Exception{
		return dao.updateProductIn(vo);
	}
	@Override
	public int updateProductOut(ProductVO vo) throws Exception{
		return dao.updateProductOut(vo);
	}
}
