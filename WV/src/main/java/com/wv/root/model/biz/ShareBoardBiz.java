package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.ShareBoardDto;

public interface ShareBoardBiz {
	
	public int write(ShareBoardDto boardDto);
	
	public List<ShareBoardDto> list(int team_no);
	
	public ShareBoardDto selectOne(int bno);
	
	public int update(ShareBoardDto dto);
	
	public int delete(int bno);

}
