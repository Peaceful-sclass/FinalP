package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.ExcelDto;

public interface ExcelDao {
	
	String NAMESPACE="Excel.";
	
	public List<ExcelDto> selectCol(int teamno); 

}
