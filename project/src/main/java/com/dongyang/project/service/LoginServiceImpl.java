package com.dongyang.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dongyang.project.dao.MainDao;
import com.dongyang.project.domain.LoginVO;

@Service
public class LoginServiceImpl implements LoginService{
	@Inject
	private MainDao dao;
	
	@Override
	public LoginVO select(String mid) throws Exception{
		return dao.select(mid);
	}
}
