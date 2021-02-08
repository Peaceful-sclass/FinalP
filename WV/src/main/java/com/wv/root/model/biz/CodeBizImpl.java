package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.CodeDao;
import com.wv.root.model.dto.CodeDto;

@Service
public class CodeBizImpl implements CodeBiz{
	
	@Autowired
	private CodeDao dao;
	
	@Override
	public List<CodeDto> selectList(int myteam) {
		
		return dao.selectList(myteam);
	}

	@Override
	public CodeDto selectOne(int myno) {
		
		return dao.selectOne(myno);
	}

	@Override
	public int insert(CodeDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(CodeDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int myno) {
		return dao.delete(myno);
	}

	@Override
	public List<CodeDto> selectGroup(int myco, int myteam) {
		return dao.selectGroup(myco, myteam);
	}

}