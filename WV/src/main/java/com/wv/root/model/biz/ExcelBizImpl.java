package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.w3c.dom.views.AbstractView;
import org.w3c.dom.views.DocumentView;

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

	@Override
	public int downExcel(List<ExcelDto> dto, Model model, int team_no){
		return dao.downExcel(dto, model, team_no);
	}

	@Override
	public String downresult() {
		
		return "success";
	}





}
