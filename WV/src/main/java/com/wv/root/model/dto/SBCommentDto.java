package com.wv.root.model.dto;

import java.util.Date;

public class SBCommentDto {
	private int rno;
	private int bno;
	private String content;
	private String writer;
	private Date regdate;
	private String member_photo;
	public SBCommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	public SBCommentDto(int rno, int bno, String content, String writer, Date regdate, String member_photo) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.member_photo = member_photo;
	}
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
