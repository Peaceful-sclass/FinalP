package com.wv.root.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.CodeDto;
import com.wv.root.model.dao.mypara;

@Repository
public class CodeDaoImpl implements CodeDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CodeDto> selectList(int myteam) {
		List<CodeDto> list = new ArrayList<CodeDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList",myteam);
		} catch (Exception e) {
			System.out.println("[error]: select list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public CodeDto selectOne(int myno) {
		CodeDto dto =null;
		
		try {
		dto= sqlSession.selectOne(NAMESPACE+"selectOne", myno);
		}catch (Exception e) {
			System.out.println("[error]:select one");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(CodeDto dto) {
		int res = 0;
		try {
		res=sqlSession.insert(NAMESPACE+"insert",dto);
		}catch (Exception e) {
			System.out.println("[error]: insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(CodeDto dto) {
		int res=0;
		
		try {
		res = sqlSession.update(NAMESPACE+"update",dto);
		}catch (Exception e) {
			System.out.println("[error]: update");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int myno) {
		int res = 0;
		try {
		res = sqlSession.delete(NAMESPACE+"delete",myno);
		}catch (Exception e) {
			System.out.println("[error]: delete");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<CodeDto> selectGroup(int myco,int myteam) {
		List<CodeDto> list = new ArrayList<CodeDto>();
		mypara para = new mypara(myco, myteam);
		try {
			list = sqlSession.selectList(NAMESPACE+"selectGroup",para);
		} catch (Exception e) {
			System.out.println("[error]: select Group");
			e.printStackTrace();
		}
		
		return list;
	}

}
