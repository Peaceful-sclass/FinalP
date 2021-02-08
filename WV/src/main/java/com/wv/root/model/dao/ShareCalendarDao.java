package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.CalendarDto;

public interface ShareCalendarDao {
	
	String NAMESPACE="Calendar.";
	
	public List<CalendarDto> selectEvent(int teamno);
	public int insert(CalendarDto dto);
	public int delete(CalendarDto dto);
}
