package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.ContestDto;

public interface ContestBiz {
	public int insert(ContestDto dto);

	public ContestDto detailpage(int contestnum);

	public List<ContestDto> contestList();
}
