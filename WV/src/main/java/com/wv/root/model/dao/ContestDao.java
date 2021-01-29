package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.ContestDto;

public interface ContestDao {

	String NAMESPACE = "contest.";
	
	public int insert(ContestDto dto);

	public ContestDto detailpage(int contestnum);

	public List<ContestDto> contestList();
	
}
