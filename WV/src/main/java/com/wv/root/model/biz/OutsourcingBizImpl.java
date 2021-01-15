package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.OutsourcingDao;
import com.wv.root.model.dto.OutexDto;
import com.wv.root.model.dto.OutsourcingDto;

@Service
public class OutsourcingBizImpl implements OutsourcingBiz {
	
	
	@Autowired
	private OutsourcingDao outdao;

	
	@Override
	public List<OutsourcingDto> outselectAll() {
		
		return outdao.outselectAll();
	}

	@Override
	public OutsourcingDto outselectOne(int outno) {
		
		return outdao.outselectOne(outno);
	}

	@Override
	public int outInsert(OutsourcingDto estdto) {
		
		return outdao.outInsert(estdto);
	}

	@Override
	public int outUpdate(OutsourcingDto estdto) {
		
		return outdao.outUpdate(estdto);
	}

	@Override
	public int outDelete(int outno) {
		
		return outdao.outDelete(outno);
	}
	
//------------------------------------------------------------------------------	

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

//--------------------------------------------------------------------	
	
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
	

//------------------------------------------------------------------------------


}
