package com.dongyang.project.dao;

import com.dongyang.project.domain.LoginVO;

public interface MainDao {
	public LoginVO select(String mid) throws Exception;
	
}
