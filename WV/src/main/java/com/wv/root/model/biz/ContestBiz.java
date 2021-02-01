package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.ContestDto;
import com.wv.root.model.util.PagingVO;

public interface ContestBiz {
	public int insert(ContestDto dto);

	public ContestDto detailpage(int contestnum);

	public List<ContestDto> selectContest(PagingVO vo);

	public List<ContestDto> fieldcontestList(PagingVO vo);

	public List<ContestDto> targetcontestList(PagingVO vo);

	public List<ContestDto> companycontestList(PagingVO vo);

	public List<ContestDto> rewardcontestList(PagingVO vo);
	
	public int countContest();	
	
	public int countField(String category);

	public int countTarget(String category);

	public int countCompany(String category);

	public int countReward(String category);	
}
