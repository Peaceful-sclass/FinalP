package com.wv.root.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.OutexDto;
import com.wv.root.model.dto.OutsourcingDto;

@Repository
public class OutsourcingDaoImpl implements OutsourcingDao {
	
	@Autowired
	SqlSessionTemplate session;

	
	@Override
	public List<OutsourcingDto> outselectAll() {
		List<OutsourcingDto> outlist = null;
		try {
			outlist = session.selectList(NameSpace+"outall");
		} catch (Exception e) {
			System.out.println("의뢰목록 가져오기 실패");
			e.printStackTrace();
		}
		return outlist;
	}

	@Override
	public OutsourcingDto outselectOne(int outno) {
		OutsourcingDto outone = null;
		try {
			outone = session.selectOne(NameSpace+"outone");
		} catch (Exception e) {
			System.out.println("의뢰상세 가져오기 실패");
			e.printStackTrace();
		}
		return outone;
	}

	@Override
	public int outInsert(OutsourcingDto outdto) { //의뢰 작성(팀)
		int res = 0;
		try {
			res = session.insert(NameSpace+"outinsert", outdto);
		} catch (Exception e) {
			System.out.println("의뢰작성 실패");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int outUpdate(OutsourcingDto outdto) { //의뢰 수정
		int res = 0;
		try {
			res = session.update(NameSpace+"outupdate", outdto);
		} catch (Exception e) {
			System.out.println("의뢰수정 실패");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int outDelete(int outno) {	//의뢰 삭제
		int res = 0;
		try {
			res = session.delete(NameSpace+"outdelete", outno);
		} catch (Exception e) {
			System.out.println("의뢰삭제 실패");
			e.printStackTrace();
		}
		return res;
	}
	
	
	
//-------------------------------------------------------------	
//신청시작
	
	@Override
	public List<OutexDto> exselectAll(int memberno) { //개인의 신청목록들
		List<OutexDto> exlist = null;
		try {
			exlist = session.selectList(NameSpace+"outexall", memberno);
		} catch (Exception e) {
			System.out.println("개인 신청목록 불러오기 실패");
			e.printStackTrace();
		}
		return exlist;
	}

	@Override
	public OutexDto exselectOne(int outexno) { //개인 신청목록 디테일
		OutexDto exdto = null;
		try {
			exdto = session.selectOne(NameSpace+"outexone", outexno);
		} catch (Exception e) {
			System.out.println("개인 신청 상세 불러오기 실패");
			e.printStackTrace();
		}
		return exdto;
	}

	@Override
	public int exInsert(OutexDto exdto) { //개인 신청하기
		int res = 0;
		try {
			res = session.insert(NameSpace+"outexinsert", exdto);
		} catch (Exception e) {
			System.out.println("개인 신청하기 실패");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int exUpdate(OutexDto exdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int exDelete(int outexno) { //신청 취소
		int res = 0;
		try {
			res = session.delete(NameSpace+"exdelete", outexno);
		} catch (Exception e) {
			System.out.println("신청 취소 실패");
			e.printStackTrace();
		}
		return res;
	}
	
	
//-------------------------------------------------------------	
//성립용 시작	

	@Override
	public OutsourcingDto estSelect(int outestno) { //성립시 가져오기.리맵으로 작성. 성립뷰에서 사용
		OutsourcingDto estdto = null;
		try {
			estdto = session.selectOne(NameSpace+"estselect", outestno);
		} catch (Exception e) {
			System.out.println("성립가져오기 실패");
			e.printStackTrace();
		}
		return estdto;
	}

	@Override
	public int estInsert(OutsourcingDto estdto) {	//저장하기 버튼
		int res = 0;
		try {
			res = session.insert(NameSpace+"estinsert", estdto);
		} catch (Exception e) {
			System.out.println("성립 내용 작성 실패");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int estUpdate(OutsourcingDto estdto) {	//수정하기 버튼
		int res = 0;
		try {
			res = session.update(NameSpace+"estupdate", estdto);
		} catch (Exception e) {
			System.out.println("성립 내용 수정 실패");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int estDelete(int outestno) { //성립취소. 안쓸것 같긴한데..
		int res = 0;
		try {
			res = session.delete(NameSpace+"estdelete", outestno);
		} catch (Exception e) {
			System.out.println("성립 취소 실패");
			e.printStackTrace();
		}
		return res;
	}
	


//-------------------------------------------------------------	
	
	

}
