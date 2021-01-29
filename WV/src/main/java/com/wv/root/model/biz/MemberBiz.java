package com.wv.root.model.biz;

import org.springframework.stereotype.Service;

import com.wv.root.model.dto.MemberDto;

@Service
public interface MemberBiz {
	public void register(MemberDto dto) throws Exception;
	
	public MemberDto login(MemberDto dto) throws Exception;
	
	public void memberUpdate(MemberDto dto) throws Exception;
	
	public void memberDelete(MemberDto dto) throws Exception;
	
	public int passChk(MemberDto dto) throws Exception;
	
}
