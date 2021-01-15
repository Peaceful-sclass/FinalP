package com.wv.root.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Inject SqlSession sql;
	// 회원가입

	public void register(MemberDto dto) throws Exception {
		sql.insert("register", dto);
	}
    
	//로그인
	@Override
	public MemberDto login(MemberDto dto) throws Exception {
		return sql.selectOne("login", dto);
	}
}


  

