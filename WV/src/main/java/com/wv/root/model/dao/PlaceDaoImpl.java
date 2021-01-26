package com.wv.root.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.PlaceDto;
import com.wv.root.model.dto.Place_commentDto;
import com.wv.root.model.dto.Place_likeDto;

@Repository
public class PlaceDaoImpl implements PlaceDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(PlaceDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error]: insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<PlaceDto> placeSelect() {
		List<PlaceDto> list = new ArrayList<PlaceDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[error]: selectList");
			e.printStackTrace();
		}		
		return list;
	}

	@Override
	public PlaceDto placeDetail(int pno) {
		PlaceDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE+"detail", pno);
		} catch (Exception e) {
			System.out.println("[error]: detail");
			e.printStackTrace();
		}		
		return dto;
	}

	@Override
	public int likecheck(Place_likeDto dto) {
		int check = 0;
		Place_likeDto res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE2+"likecheck", dto);
		} catch (Exception e) {
			System.out.println("[error]: likecheck");
			e.printStackTrace();
		}
		if(res!=null) {
			check = res.getLikecheck();
		}else {
			check = 2;
		}
		return check;
	}

	@Override
	public int likeinsert(Place_likeDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE2+"likeinsert", dto);
		} catch (Exception e) {
			System.out.println("[error]: likeinsert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int likeup(int pno) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"likeup", pno);
		} catch (Exception e) {
			System.out.println("[error]: likeup");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int likecancel(Place_likeDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE2+"likecancel", dto);
		} catch (Exception e) {
			System.out.println("[error]: likecancel");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int likedown(int pno) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"likedown", pno);
		} catch (Exception e) {
			System.out.println("[error]: likedown");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int likeupdate(Place_likeDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE2+"likeupdate", dto);
		} catch (Exception e) {
			System.out.println("[error]: likeupdate");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int commentinsert(Place_commentDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE3+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error]: commentinsert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<Place_commentDto> pcommentlist(int pno) {
		 List<Place_commentDto> list = new ArrayList<Place_commentDto>();
		try {
			list = sqlSession.selectList(NAMESPACE3+"pcommentlist", pno);
		} catch (Exception e) {
			System.out.println("[error]: pcommentlist");
			e.printStackTrace();
		}
		return list;	
	}

	@Override
	public int commentupdate(Place_commentDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE3+"update", dto);
		} catch (Exception e) {
			System.out.println("[error]: commentupdate");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int commentdelete(int pcno) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE3+"delete", pcno);
		} catch (Exception e) {
			System.out.println("[error]: commentdelete");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deletePlace(int pno) { 
	int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"delete", pno);
		} catch (Exception e) {
			System.out.println("[error]: deletePlace");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updatePlace(PlaceDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			System.out.println("[error]: updatePlace");
			e.printStackTrace();
		}
		return res;
	}

}
