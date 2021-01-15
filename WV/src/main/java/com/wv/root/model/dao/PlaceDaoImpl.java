package com.wv.root.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.PlaceDto;

@Repository
public class PlaceDaoImpl implements PlaceDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(PlaceDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error]: insert");
			e.printStackTrace();
		}
		return res;
	}

}
