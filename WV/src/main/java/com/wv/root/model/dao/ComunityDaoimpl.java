package com.wv.root.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.ComCommentDto;
import com.wv.root.model.dto.ComunityDto;
import com.wv.root.model.dto.CpDto;

@Repository
public class ComunityDaoimpl implements ComunityDao {
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<ComunityDto> selectAll(CpDto cpdto) {
		List<ComunityDto> list = null;
		try {
			Map<String, Object> dto = new HashMap<String, Object>();
			dto.put("cpdto", cpdto);
			dto.put("search",cpdto.getSearch());
			System.out.println("[selectAll]  Map dto : "+ dto);
			list = session.selectList(NameSpace+"comunityall", dto); // 현재페이지의 글목록을 추출 
//			System.out.println("[selectAll]  list :"+list);
			
		} catch (Exception e) {
			System.out.println("글목록 불러오기 실패");
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int countList(CpDto cpdto) {
		int count = 0;
		Map<String, Object> dto = new HashMap<String, Object>();
		dto.put("cpdto", cpdto);
		dto.put("search",cpdto.getSearch());
		try {
			System.out.println("[countList]  oldcpdto :"+cpdto);
//			count = session.selectList(NameSpace+"comunitycount", oldcpdto).size();
			count = session.selectOne(NameSpace+"comunitycount", dto);
			System.out.println("[countList]  count : " + count);//현재 카테고리의 총데이터수를 파악한 후 그에 맞는 페이지정보를 dto에 갱신
		} catch (Exception e) {
			System.out.println("query fail.....");
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public ComunityDto selectOne(int cno) {
		ComunityDto comdto = null;
		try {
			System.out.println("[selectOne]  cno: "+cno);
			comdto = session.selectOne(NameSpace+"comunityone", cno);
			session.update(NameSpace+"viewsUp", cno);
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
			System.out.println("[comInsert:dto]  "+comdto);
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
			System.out.println("[comDelete:cno]  "+cno);
			res = session.delete("comdelete", cno);
		} catch (Exception e) {
			System.out.println("글삭제 실패");
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	
//-------------------------------------------------------------------------	
//comment start	

	@Override
	public List<ComCommentDto> cmtselectAll(int cno) {
		List<ComCommentDto> cmtlist = null;
		try {
			cmtlist = session.selectList("comcmtselect", cno);
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
			System.out.println("여긴 오나?");
			res = session.insert("comcmtinsert", comcmtdto);
		} catch (Exception e) {
			System.out.println("댓글쓰기 실패");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int cmtAnswer(ComCommentDto comcmtdto) {
		int res = 0;
		try {
			res = session.update("comcmtbeforeanswer", comcmtdto);
			res = session.insert("comcmtanswer", comcmtdto);
		} catch (Exception e) {
			System.out.println("답변쓰기 실패");
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
