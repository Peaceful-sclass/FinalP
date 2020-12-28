package com.wv.root.model.dto;

import java.util.Date;

public class ComunityDto {
	private int cno;
	private String category;
	private String title;
	private String content;
	private Date regdate;
	private int memberno;
	private String memberid;
	
	
	public ComunityDto() {
		super();
	}


	public ComunityDto(int cno, String category, String title, String content, Date regdate, int memberno,
			String memberid) {
		super();
		this.cno = cno;
		this.category = category;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.memberno = memberno;
		this.memberid = memberid;
	}


	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
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


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public int getMemberno() {
		return memberno;
	}


	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}


	public String getMemberid() {
		return memberid;
	}


	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}


	@Override
	public String toString() {
		return "ComunityDto [cno=" + cno + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", memberno=" + memberno + ", memberid=" + memberid + "]";
	}
	
	
	
	
}
