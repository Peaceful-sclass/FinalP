package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.SBCommentDto;

public interface SBCommentDao {
	String NAMESPACE = "SBCommentMapper.";

	//댓글조회
	public List<SBCommentDto> comment(int bno);
	
	//댓글 작성
	public int writeComment(SBCommentDto dto);
	
	//댓글 삭제
	public int deleteComment(SBCommentDto dto);
	
	//댓글선택
	public SBCommentDto selectComment(int rno);
}
