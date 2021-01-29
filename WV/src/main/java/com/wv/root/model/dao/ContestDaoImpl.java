package com.wv.root.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.ContestDto;

@Repository
public class ContestDaoImpl implements ContestDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(ContestDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error]: insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public ContestDto detailpage(int contestnum) {
		ContestDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", contestnum);
		} catch (Exception e) {
			System.out.println("[error]: select one");
			e.printStackTrace();
		}		
		return dto;
	}

	@Override
	public List<ContestDto> contestList() {
		List<ContestDto> list = new ArrayList<ContestDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[error]: select list");
			e.printStackTrace();
		}
		
		return list;
	}

}
