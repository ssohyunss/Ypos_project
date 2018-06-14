package com.dongyang.project.domain;

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
}
