package com.wv.root.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.ContestDao;
import com.wv.root.model.dto.ContestDto;

@Service
public class ContestBizImpl implements ContestBiz{
	
	@Autowired
	private ContestDao dao;
	
	@Override
	public int insert(ContestDto dto) {
		
		return dao.insert(dto);
	}

}
