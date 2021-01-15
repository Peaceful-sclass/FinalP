package com.wv.root.model.dao;

import com.wv.root.model.dto.ContestDto;

public interface ContestDao {

	String NAMESPACE = "contest.";
	
	int insert(ContestDto dto);
	
}
