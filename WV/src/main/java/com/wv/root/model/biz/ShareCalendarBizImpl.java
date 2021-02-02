package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.ShareCalendarDao;
import com.wv.root.model.dto.CalendarDto;

@Service
public class ShareCalendarBizImpl implements ShareCalendarBiz{
	
	@Autowired
	private ShareCalendarDao dao;
	
	@Override
	public List<CalendarDto> selectEvent(int teamno) {
		return dao.selectEvent(teamno);
	}

	@Override
	public int insert(CalendarDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(String calTitle) {
		return dao.delete(calTitle);
	}

}
