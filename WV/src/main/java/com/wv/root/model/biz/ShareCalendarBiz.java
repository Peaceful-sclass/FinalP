package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.CalendarDto;

public interface ShareCalendarBiz {

	public List<CalendarDto> selectEvent(int teamno);
	public int insert(CalendarDto dto);
	public int delete(String calTitle);
	
}
