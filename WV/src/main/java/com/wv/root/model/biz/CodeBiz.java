package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.CodeDto;

public interface CodeBiz {
	
	public List<CodeDto> selectList(int myteam);
	public CodeDto selectOne(int myno);
	public List<CodeDto> selectGroup(int myco, int myteam);
	public int insert(CodeDto dto);
	public int update(CodeDto dto);
	public int delete(int myno);
}
 