package com.wv.root.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.ShareBoardDto;

@Repository
public class ShareBoardDaoImpl implements ShareBoardDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int write(ShareBoardDto boardDto) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert(NAMESPACE+"insert",boardDto);
		
		return res;
	}

	@Override
	public List<ShareBoardDto> list(int team_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"list",team_no);
	}

	@Override
	public ShareBoardDto selectOne(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"selectOne",bno);
	}

	@Override
	public int update(ShareBoardDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.update(NAMESPACE+"update",dto);
		return res;
	}

	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.delete(NAMESPACE+"delete",bno);
		return res;
	}

}
