package com.wv.root.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.ContestDto;
import com.wv.root.model.util.PagingVO;

@Repository
public class ContestDaoImpl implements ContestDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(ContestDto dto) {
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
	public ContestDto detailpage(int contestnum) {
		ContestDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", contestnum);
		} catch (Exception e) {
			System.out.println("[error]: select one");
			e.printStackTrace();
		}		
		return dto;
	}

	@Override
	public List<ContestDto> selectContest(PagingVO vo) {
		List<ContestDto> list = new ArrayList<ContestDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"selectcontest", vo);
		} catch (Exception e) {
			System.out.println("[error]: selectcontest");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ContestDto> fieldcontestList(PagingVO vo) {
		List<ContestDto> list = new ArrayList<ContestDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"fieldList", vo);
		} catch (Exception e) {
			System.out.println("[error]: fieldList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ContestDto> targetcontestList(PagingVO vo) {
		List<ContestDto> list = new ArrayList<ContestDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"targetList", vo);
		} catch (Exception e) {
			System.out.println("[error]: targetListlist");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ContestDto> companycontestList(PagingVO vo) {
		List<ContestDto> list = new ArrayList<ContestDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"companyList", vo);
		} catch (Exception e) {
			System.out.println("[error]: companylist");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ContestDto> rewardcontestList(PagingVO vo) {
		List<ContestDto> list = new ArrayList<ContestDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"rewardList", vo);
		} catch (Exception e) {
			System.out.println("[error]: rewardlist");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int countContest() {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"countcontest");
		} catch (Exception e) {
			System.out.println("[error]: countcontest");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int countField(String category) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"countfield", category);
		} catch (Exception e) {
			System.out.println("[error]: countfield");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int countTarget(String category) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"counttarget", category);
		} catch (Exception e) {
			System.out.println("[error]: counttarget");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int countCompany(String category) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"countcompany", category);
		} catch (Exception e) {
			System.out.println("[error]: countcompany");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int countReward(String category) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"countreward", category);
		} catch (Exception e) {
			System.out.println("[error]: countreward");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ContestDto> homeClist() {
		List<ContestDto> list = new ArrayList<ContestDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"homeclist");
		} catch (Exception e) {
			System.out.println("[error]: homeclist");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int contestDelete(int contestnum) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE+"contestdelete", contestnum);
		} catch (Exception e) {
			System.out.println("[error]: contestdelete");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateContest(ContestDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"updatecontest", dto);
		} catch (Exception e) {
			System.out.println("[error]: updatecontest");
			e.printStackTrace();
		}
		return res;
	}

}
