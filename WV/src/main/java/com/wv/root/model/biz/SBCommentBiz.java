package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.SBCommentDto;

public interface SBCommentBiz {
	
	public List<SBCommentDto> comment(int bno);
	
	public int writeComment(SBCommentDto dto);
	
	public int deleteComment(SBCommentDto dto);
	
	public SBCommentDto selectComment(int rno);

}
