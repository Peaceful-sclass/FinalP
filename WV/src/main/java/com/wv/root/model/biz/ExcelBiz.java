package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.ExcelDto;

public interface ExcelBiz {

	public List<ExcelDto> selectCol(int teamno);
	
}
