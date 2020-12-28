package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.ShareBoardDao;
import com.wv.root.model.dto.ShareBoardDto;

@Service
public class ShareBoardBizImpl implements ShareBoardBiz{
	
	@Autowired
	private ShareBoardDao dao;

	@Override
	public int write(ShareBoardDto boardDto) {
		// TODO Auto-generated method stub
		return dao.write(boardDto);
	}

	@Override
	public List<ShareBoardDto> list(int team_no) {
		// TODO Auto-generated method stub
		return dao.list(team_no);
	}

	@Override
	public ShareBoardDto selectOne(int bno) {
		// TODO Auto-generated method stub
		return dao.selectOne(bno);
	}

	@Override
	public int update(ShareBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		return dao.delete(bno);
	}

}
