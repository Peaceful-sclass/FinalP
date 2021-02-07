package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.MemberDto;
import com.wv.root.model.dto.TeamDto;

public interface MemberDao {
	   

	// 회원가입
	public void register(MemberDto dto) throws Exception;
	
	// 로그인
	public MemberDto login(MemberDto dto) throws Exception;
	
	// 회원정보 수정
	public void memberUpdate(MemberDto dto) throws Exception;
	
	// 회원탈퇴
	public void memberDelete(MemberDto dto) throws Exception;

	public TeamDto teamInfo(int member_no);
	
	// 탈퇴 비번 체크
	public int passChk(MemberDto dto) throws Exception;

	public List <String> findid(String member_email);

	public String findpw(MemberDto dto);
	
	


}
