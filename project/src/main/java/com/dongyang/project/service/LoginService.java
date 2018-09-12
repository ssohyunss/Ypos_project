package com.dongyang.project.service;

import java.util.List;

import com.dongyang.project.domain.ImageVO;
import com.dongyang.project.domain.LoginVO;
import com.dongyang.project.domain.ProductVO;

public interface LoginService {
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
	
}
