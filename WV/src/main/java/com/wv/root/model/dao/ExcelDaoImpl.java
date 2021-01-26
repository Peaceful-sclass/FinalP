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
			System.out.println("[error]: selectCol");
			e.printStackTrace();
		}
		System.out.println("list값: " + list);
		
		return list;
	}


	@Override
	public int insertExcel(ExcelDto dto) {
		int res = 0;
		System.out.println("dto값 확인"+dto);
		
		try {
			res=sqlSession.insert(NAMESPACE+"insertExcel", dto);
			
		} catch (Exception e) {
			System.out.println("[error]: insertExcel");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public ExcelDto selectRow(ExcelDto dto) {
		
		try {
			dto=sqlSession.selectOne(NAMESPACE+"selectRowOne", dto);
			
		} catch (Exception e) {
			System.out.println("[error]: selectExcelOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int updateExcel(ExcelDto dto) {
		int res = 0;
		System.out.println("dto값 확인"+dto.getColA()+dto.getColB());
		
		try {
			res=sqlSession.update(NAMESPACE+"updateExcel", dto);
		} catch (Exception e) {
			System.out.println("[error]: updateExcel");
			e.printStackTrace();
		}
		
		System.out.println("update값 확인 "+dto.getColA()+" "+dto.getColB()+" "+dto.getColC());
		
		return res;
	}






	

}
