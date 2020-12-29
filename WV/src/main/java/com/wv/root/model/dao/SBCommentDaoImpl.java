package com.wv.root.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.SBCommentDto;

@Repository
public class SBCommentDaoImpl implements SBCommentDao{
	
	@Autowired
	private SqlSession sql;

	@Override
	public List<SBCommentDto> comment(int bno) {
		// TODO Auto-generated method stub
		return sql.selectList(NAMESPACE+"comment", bno);
	}

	@Override
	public int writeComment(SBCommentDto dto) {
		// TODO Auto-generated method stub
		return sql.insert(NAMESPACE+"writeComment", dto);
	}

	@Override
	public int deleteComment(SBCommentDto dto) {
		// TODO Auto-generated method stub
		return sql.delete(NAMESPACE+"deleteComment", dto);
	}

	@Override
	public SBCommentDto selectComment(int rno) {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE+"selectComment", rno);
	}

}
