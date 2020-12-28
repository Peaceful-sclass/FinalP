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
