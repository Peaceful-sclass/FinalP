package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.OutexDto;
import com.wv.root.model.dto.OutsourcingDto;

public interface OutsourcingDao {
	
	String NameSpace = "wvout.";
	
	List<OutsourcingDto> outselectAll();
	OutsourcingDto outselectOne(int outno);
	int outInsert(OutsourcingDto outdto);
	int outUpdate(OutsourcingDto outdto);
	int outDelete(int outno);
	
	List<OutexDto> exselectAll(int memberno);
	OutexDto exselectOne(int outexno);
	int exInsert(OutexDto exdto);
	int exUpdate(OutexDto exdto);
	int exDelete(int outexno);
	
	OutsourcingDto estSelect(int outestno);
	int estInsert(OutsourcingDto estdto);
	int estUpdate(OutsourcingDto estdto);
	int estDelete(int outestno);

}
