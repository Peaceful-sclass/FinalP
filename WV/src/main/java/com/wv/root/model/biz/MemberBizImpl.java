package com.wv.root.model.biz;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wv.root.model.dao.MemberDao;
import com.wv.root.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz{
    
	@Inject
	MemberDao dao;

	@Override
	public void register(MemberDto dto) throws Exception {
		dao.register(dto);
	}

	@Override
	public MemberDto login(MemberDto dto) throws Exception {
		return dao.login(dto);
	}
	

}
