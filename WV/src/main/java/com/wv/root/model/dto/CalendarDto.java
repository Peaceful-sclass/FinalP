package com.wv.root.model.dto;

public class CalendarDto {
	private int calNo;
	private int teamNo;
	private String calTitle;
	private String calStart;
	
	private int memNo;
	
	public CalendarDto() {
		super();
	}
	public CalendarDto(int calNo, int teamNo, String calTitle, String calStart) {
		super();
		this.teamNo = teamNo;
		this.calNo = calNo;
		this.calTitle = calTitle;
		this.calStart = calStart;
	}
	
	public CalendarDto(int teamNo, int memNo) {
		super();
		this.teamNo = teamNo;
		this.memNo = memNo;
	}
	
	
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getTeamNo() {
		return teamNo;
	}
	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}
	public int getCalNo() {
		return calNo;
	}
	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}
	public String getCalTitle() {
		return calTitle;
	}
	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}
	public String getCalStart() {
		return calStart;
	}
	public void setCalStart(String calStart) {
		this.calStart = calStart;
	}
	
	
	
	
}
