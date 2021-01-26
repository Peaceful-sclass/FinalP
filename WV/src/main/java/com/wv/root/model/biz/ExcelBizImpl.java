package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.ExcelDao;
import com.wv.root.model.dto.ExcelDto;

@Service
public class ExcelBizImpl implements ExcelBiz{

	@Autowired
	private ExcelDao dao;

	@Override
	public List<ExcelDto> selectCol(int teamno) {
		
		return dao.selectCol(teamno);
	}

	@Override
	public int insertExcel(ExcelDto dto) {
		return dao.insertExcel(dto);
	}
	
	@Override
	public ExcelDto selectRow(ExcelDto dto) {
		return dao.selectRow(dto);
	}
	
	@Override
	public int updateExcel(ExcelDto dto) {
		return dao.updateExcel(dto);
	}





}
