package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.ComCommentDto;
import com.wv.root.model.dto.ComunityDto;

public interface ComunityDao {
	
	String namespace = "wvcomunity.";
	
	List<ComunityDto> selectAll(String category);
	ComunityDto selectOne(int cno);
	int comInsert(ComunityDto comdto);
	int comUpdate(ComunityDto comdto);
	int comDelete(int cno);
	
	List<ComCommentDto> cmtselectAll();
	int cmtInsert(ComCommentDto comcmtdto);
	int cmtUpdate(ComCommentDto comcmtdto);
	int cmtDelete(int comcommentno);
	
	
	
}
