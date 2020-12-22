package com.wv.root.model.dao;

import com.wv.root.model.dto.MemberDto;

public interface MemberDao {
	   String NAMESPACE ="mymember.";
	   
	   public MemberDto login(MemberDto dto);
	   public int insert(MemberDto dto);
	}
