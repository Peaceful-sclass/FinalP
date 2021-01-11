package com.wv.root.model.dao;

import java.util.List;
import java.util.Map;

import com.wv.root.model.dto.ShareBoardDto;
import com.wv.root.model.util.SearchCriteria;

public interface ShareBoardDao {
	String NAMESPACE ="shareBoard.";
	
	//게시판 글 작성
	public int write(ShareBoardDto boardDto);
	
	//게시판 리스트
	public List<ShareBoardDto> list(SearchCriteria scri);
	
	//게시물 갯수
	public int listCount(SearchCriteria scri);
	
	//게시물 선택
	public ShareBoardDto selectOne(int bno);
	
	//게시물 수정
	public int update(ShareBoardDto dto);
	
	//게시물 삭제
	public int delete(int bno);
	
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map);
	
	//첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno);
	
	//첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map);
	
	//첨부파일 수정
	public void updateFile(Map<String, Object> map);
	
	//조회수
	public void SBViews(int bno);
	
	

}
