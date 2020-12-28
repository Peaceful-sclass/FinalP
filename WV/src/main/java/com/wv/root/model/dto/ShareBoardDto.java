package com.wv.root.model.dto;

import java.util.Date;

public class ShareBoardDto {
	private int bno;
	private int team_no;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	public ShareBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShareBoardDto(int bno, int team_no, String title, String content, String writer, Date regdate) {
		super();
		this.bno = bno;
		this.team_no = team_no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getTeam_no() {
		return team_no;
	}
	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	

}
