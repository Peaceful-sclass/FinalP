package com.wv.root.model.biz;

import java.util.List;
import java.util.Map;


import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wv.root.model.dto.ShareBoardDto;
import com.wv.root.model.util.SearchCriteria;

public interface ShareBoardBiz {
	
	public int write(ShareBoardDto boardDto,MultipartHttpServletRequest mpRequest);
	
	public List<ShareBoardDto> list(SearchCriteria scri);
	
	public int listCount(SearchCriteria scri);
	
	public ShareBoardDto selectOne(int bno);
	
	public int update(ShareBoardDto dto, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest);
	
	public int delete(int bno);
	
	public List<Map<String, Object>> selectFileList(int bno);
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map);
	

}
