package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.CodeDto;

public interface CodeDao {

	String NAMESPACE="myboard.";
	
	public List<CodeDto> selectList();
	public CodeDto selectOne(int myno);
	public int insert(CodeDto dto);
	public int update(CodeDto dto);
	public int delete(int myno);
	
	
	
	
	
	
}