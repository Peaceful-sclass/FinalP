package com.wv.root.model.dao;

import com.wv.root.model.dto.MemberDto;

public interface MemberDao {
	   

	// 회원가입
	public void register(MemberDto dto) throws Exception;
	
	// 로그인
	public MemberDto login(MemberDto dto) throws Exception;
	
	// 회원정보 수정
	public void memberUpdate(MemberDto dto) throws Exception;
	
	// 회원탈퇴
	public void memberDelete(MemberDto dto) throws Exception;
	
	// 탈퇴 비번 체크
	public int passChk(MemberDto dto) throws Exception;
}
