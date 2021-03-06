package com.wv.root.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.CalendarDto;

@Repository
public class ShareCalendarDaoImpl implements ShareCalendarDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public String selectTeamGrade(CalendarDto dto) {
		String result=null;
		
		try {
			result = sqlSession.selectOne(NAMESPACE+"gradeCheck", dto);
		} catch (Exception e) {
			System.out.println("[error]: selectEvent");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@Override
	public List<CalendarDto> selectEvent(int teamno) {
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		try {
			//result = sqlSession.selectOne(NAMESPACE+"gradeCheck", teamno);
					//sqlSession.selectList(NAMESPACE+"gradeCheck", teamno);
			list = sqlSession.selectList(NAMESPACE+"selectEvent", teamno);
		} catch (Exception e) {
			System.out.println("[error]: selectEvent");
			e.printStackTrace();
		}
		System.out.println("list값: " + list);
		
		return list;
	}


	@Override
	public int insert(CalendarDto dto) {
		int res = 0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insertEvent", dto);
		} catch (Exception e) {
			System.out.println("[error]: insertEvent");
			e.printStackTrace();
		}
		
		return res;
	}


	@Override
	public int delete(CalendarDto dto) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "deleteEvent", dto);
		} catch (Exception e) {
			System.out.println("[error]: deleteEvent");
			e.printStackTrace();
		}
		
		return res;
	}




}
