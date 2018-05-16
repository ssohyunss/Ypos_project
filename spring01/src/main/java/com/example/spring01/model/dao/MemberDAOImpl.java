package com.example.spring01.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring01.model.dto.MemberDTO;

//현재 클래스를 스프링에서 관리하는 dao bean으로 설정
@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject //의존관계주입 (Dependency Injection, DI)
	SqlSession sqlSession; //root-context.xml
	
	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList("member.memberList");
	}

	@Override
	public void insertMember(MemberDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberDTO viewMember(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteMember(String userid) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean chechPw(String userid, String passwd) {
		// TODO Auto-generated method stub
		return false;
	}

}
