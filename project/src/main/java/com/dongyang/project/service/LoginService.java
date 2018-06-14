package com.dongyang.project.service;

import com.dongyang.project.domain.LoginVO;

public interface LoginService {
	public LoginVO select(String mid) throws Exception;
}
