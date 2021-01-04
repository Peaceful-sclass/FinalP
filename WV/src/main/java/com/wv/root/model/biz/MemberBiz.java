package com.wv.root.model.biz;

import org.springframework.stereotype.Service;

import com.wv.root.model.dto.MemberDto;

@Service
public interface MemberBiz {
	public void register(MemberDto dto) throws Exception;
	
	public MemberDto login(MemberDto dto) throws Exception;
}
