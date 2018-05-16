package com.example.spring01.model.dao;

import java.util.List;

import com.example.spring01.model.dto.MemberDTO;

public interface MemberDAO {
	
	public List<MemberDTO> memberList(); //회원목록
	public void insertMember(MemberDTO dto); //회원추가
	public MemberDTO viewMember(String userid); //회원리스트
	public void deleteMember(String userid); //회원삭제
	public void updateMember(MemberDTO dto); //회원추가
	public boolean chechPw(String userid, String passwd);

}
