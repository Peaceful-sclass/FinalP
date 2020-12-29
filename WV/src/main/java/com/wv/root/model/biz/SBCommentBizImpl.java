package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.SBCommentDao;
import com.wv.root.model.dto.SBCommentDto;

@Service
public class SBCommentBizImpl implements SBCommentBiz{
	
	@Autowired
	private SBCommentDao dao;

	@Override
	public List<SBCommentDto> comment(int bno) {
		// TODO Auto-generated method stub
		return dao.comment(bno);
	}

	@Override
	public int writeComment(SBCommentDto dto) {
		// TODO Auto-generated method stub
		return dao.writeComment(dto);
	}

	@Override
	public int deleteComment(SBCommentDto dto) {
		// TODO Auto-generated method stub
		return dao.deleteComment(dto);
	}

	@Override
	public SBCommentDto selectComment(int rno) {
		// TODO Auto-generated method stub
		return dao.selectComment(rno);
	}

}
