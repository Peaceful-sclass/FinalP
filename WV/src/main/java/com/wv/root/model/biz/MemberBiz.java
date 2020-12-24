package com.wv.root.model.biz;


import com.wv.root.model.dto.MemberDto;

public interface MemberBiz {
	public MemberDto login(MemberDto dto);
    public int insert(MemberDto dto);
}
