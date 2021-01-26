package com.wv.root.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.ExcelDto;

@Repository
public class ExcelDaoImpl implements ExcelDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<ExcelDto> selectCol(int teamno) {
		List<ExcelDto> list = new ArrayList<ExcelDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectRow", teamno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("list값: " + list);
		
		return list;
	}
	
	

}
