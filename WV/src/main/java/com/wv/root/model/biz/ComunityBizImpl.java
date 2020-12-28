package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.ComunityDao;
import com.wv.root.model.dao.ComunityDaoimpl;
import com.wv.root.model.dto.ComCommentDto;
import com.wv.root.model.dto.ComunityDto;

@Service
public class ComunityBizImpl implements ComunityBiz {
	
	@Autowired
	private ComunityDao comdao;

	
	
	@Override
	public List<ComunityDto> selectAll(String category) {
		// TODO Auto-generated method stub
		return comdao.selectAll(category);
	}

	@Override
	public ComunityDto selectOne(int cno) {
		// TODO Auto-generated method stub
		return comdao.selectOne(cno);
	}

	@Override
	public int comInsert(ComunityDto comdto) {
		// TODO Auto-generated method stub
		return comdao.comInsert(comdto);
	}

	@Override
	public int comUpdate(ComunityDto comdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int comDelete(int cno) {
		// TODO Auto-generated method stub
		return 0;
	}

	
//-------------------------------------------------------------------------	
	
	
	@Override
	public List<ComCommentDto> cmtselectAll() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int cmtInsert(ComCommentDto comcmtdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cmtUpdate(ComCommentDto comcmtdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cmtDelete(int comcommentno) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	//-------------------------------------------------------------------------
	
	
	
	
	
	
	

}
