package com.wv.root.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.ShareBoardDto;
import com.wv.root.model.util.SearchCriteria;

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
	public List<ShareBoardDto> list(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"listPage",scri);
	}

	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"listCount",scri);
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
		sqlSession.delete(NAMESPACE+"delete2", bno);
		res = sqlSession.delete(NAMESPACE+"delete",bno);
		return res;
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+"insertFile", map);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"selectFileList", bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"selectFileInfo", map);
	}

	@Override
	public void updateFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		sqlSession.update(NAMESPACE+"updateFile", map);
		
	}

	@Override
	public void SBViews(int bno) {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+"SBViews", bno);
	}


}
