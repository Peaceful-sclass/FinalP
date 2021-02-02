package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.ContestDao;
import com.wv.root.model.dto.ContestDto;
import com.wv.root.model.util.PagingVO;

@Service
public class ContestBizImpl implements ContestBiz{
	
	@Autowired
	private ContestDao dao;
	
	@Override
	public int insert(ContestDto dto) {
		
		return dao.insert(dto);
	}

	@Override
	public ContestDto detailpage(int contestnum) {
		return dao.detailpage(contestnum);
	}

	@Override
	public List<ContestDto> selectContest(PagingVO vo) {
		return dao.selectContest(vo);
	}

	@Override
	public List<ContestDto> fieldcontestList(PagingVO vo) {
		return dao.fieldcontestList(vo);
	}

	@Override
	public List<ContestDto> targetcontestList(PagingVO vo) {
		return dao.targetcontestList(vo);
	}

	@Override
	public List<ContestDto> companycontestList(PagingVO vo) {
		return dao.companycontestList(vo);
	}

	@Override
	public List<ContestDto> rewardcontestList(PagingVO vo) {
		return dao.rewardcontestList(vo);
	}

	@Override
	public int countContest() {
		return dao.countContest();
	}

	@Override
	public int countField(String category) {
		return dao.countField(category);
	}

	@Override
	public int countTarget(String category) {
		return dao.countTarget(category);
	}

	@Override
	public int countCompany(String category) {
		return dao.countCompany(category);
	}

	@Override
	public int countReward(String category) {
		return dao.countReward(category);
	}

	@Override
	public List<ContestDto> homeClist() {
		return dao.homeClist();
	}

}
