package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.ComunityDao;
import com.wv.root.model.dto.ComCommentDto;
import com.wv.root.model.dto.ComunityDto;

@Service
public class ComunityBizImpl implements ComunityBiz {
	
	@Autowired
	private ComunityDao comdao;

	
	
	@Override
	public List<ComunityDto> selectAll(String category) {
		return comdao.selectAll(category);
	}

	@Override
	public ComunityDto selectOne(int cno) {
		return comdao.selectOne(cno);
	}

	@Override
	public int comInsert(ComunityDto comdto) {
		return comdao.comInsert(comdto);
	}

	@Override
	public int comUpdate(ComunityDto comdto) {
		return comdao.comUpdate(comdto);
	}

	@Override
	public int comDelete(int cno) {
		return comdao.comDelete(cno);
	}

	
//-------------------------------------------------------------------------	
	
	
	@Override
	public List<ComCommentDto> cmtselectAll(int comcmtno) {
		return comdao.cmtselectAll(comcmtno);
	}


	@Override
	public int cmtInsert(ComCommentDto comcmtdto) {
		return comdao.cmtInsert(comcmtdto);
	}

	@Override
	public int cmtUpdate(ComCommentDto comcmtdto) {
		return comdao.cmtUpdate(comcmtdto);
	}

	@Override
	public int cmtDelete(int comcmtno) {
		return comdao.cmtDelete(comcmtno);
	}
	

	//-------------------------------------------------------------------------
	
	
	
	
	
	
	

}
