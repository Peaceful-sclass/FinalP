package com.wv.root.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OutsourcingDto outselectOne(int outno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int outInsert(OutsourcingDto estdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int outUpdate(OutsourcingDto estdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int outDelete(int outno) {
		// TODO Auto-generated method stub
		return 0;
	}
	
//-------------------------------------------------------------	

	@Override
	public List<OutexDto> exselectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OutexDto exselectOne(int outexno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int exInsert(OutexDto exdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int exUpdate(OutexDto exdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int exDelete(int outexno) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
//-------------------------------------------------------------	
	

	@Override
	public OutsourcingDto estSelect(int outestno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int estInsert(OutsourcingDto estdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int estUpdate(OutsourcingDto estdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int estDelete(int outestno) {
		// TODO Auto-generated method stub
		return 0;
	}
	


//-------------------------------------------------------------	
	
	

}
