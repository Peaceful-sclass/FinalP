package com.wv.root.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.ComCommentDto;
import com.wv.root.model.dto.ComunityDto;

@Repository
public class ComunityDaoimpl implements ComunityDao {
	
	@Autowired
	SqlSessionTemplate session;

	
	
	@Override
	public List<ComunityDto> selectAll(String category) {
		List<ComunityDto> list = null;
		try {
			list = session.selectList(NameSpace+"comunityall");
		} catch (Exception e) {
			System.out.println("글목록 불러오기 실패");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ComunityDto selectOne(int cno) {
		ComunityDto comdto = null;
		try {
			comdto = session.selectOne(NameSpace+"comunityone", cno);
		} catch (Exception e) {
			System.out.println("글 불러오기 실패");
			e.printStackTrace();
		}
		return comdto;
	}

	@Override
	public int comInsert(ComunityDto comdto) {
		int res = 0;
		
		try {
			res = session.insert("cominsert", comdto);
			
		} catch (Exception e) {
			System.out.println("글쓰기 실패");
			e.printStackTrace();
		}
				
		return res;
	}

	@Override
	public int comUpdate(ComunityDto comdto) {
		int res = 0;
		
		try {
			res = session.update("comupdate", comdto);
		} catch (Exception e) {
			System.out.println("글수정 실패");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int comDelete(int cno) {
	int res = 0;
		
		try {
			res = session.delete("comdelete", cno);
		} catch (Exception e) {
			System.out.println("글삭제 실패");
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	
//-------------------------------------------------------------------------	
	

	@Override
	public List<ComCommentDto> cmtselectAll(int comcmtno) {
		List<ComCommentDto> cmtlist = null;
		try {
			cmtlist = session.selectList("comcmtselect", comcmtno);
		} catch (Exception e) {
			System.out.println("댓글 가져오기 실패");
			e.printStackTrace();
		}
		
		return cmtlist;
	}

	@Override
	public int cmtInsert(ComCommentDto comcmtdto) {
		int res = 0;
		try {
			res = session.insert("comcmtinsert", comcmtdto);
		} catch (Exception e) {
			System.out.println("댓글쓰기 실패");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cmtUpdate(ComCommentDto comcmtdto) {
		int res = 0;
		try {
			res = session.update("comcmtupdate", comcmtdto);
		} catch (Exception e) {
			System.out.println("댓글수정 실패");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cmtDelete(int comcmtno) {
		int res = 0;
		try {
			res = session.delete("comcmtdelete", comcmtno);
		} catch (Exception e) {
			System.out.println("댓글삭제 실패");
			e.printStackTrace();
		}
		return res;
		
	}
	
	
//-------------------------------------------------------------------------	
	
	
	
	
	
	
	

}
