package com.wv.root.model.biz;

import org.springframework.stereotype.Service;

import com.wv.root.model.dto.MemberDto;

@Service
public interface MemberBiz {
	public MemberDto login(MemberDto dto);
    public int insert(MemberDto dto);
}
