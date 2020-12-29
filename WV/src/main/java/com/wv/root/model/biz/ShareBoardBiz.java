package com.wv.root.model.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wv.root.model.dto.ShareBoardDto;
import com.wv.root.model.util.SearchCriteria;

public interface ShareBoardBiz {
	
	public int write(ShareBoardDto boardDto,MultipartHttpServletRequest mpRequest);
	
	public List<ShareBoardDto> list(SearchCriteria scri);
	
	public int listCount(SearchCriteria scri);
	
	public ShareBoardDto selectOne(int bno);
	
	public int update(ShareBoardDto dto);
	
	public int delete(int bno);

}
