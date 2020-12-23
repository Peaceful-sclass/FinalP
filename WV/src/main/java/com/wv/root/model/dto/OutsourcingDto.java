package com.wv.root.model.dto;

import java.util.Date;

public class OutsourcingDto {
	private int outno;
//	private String category;
	private String title;
	private String content;
	private boolean conclusion;	//의뢰체결여부
	private Date regdate;
	private int teamno;
	private String teamname;
	private String memberid;
	
	
	public OutsourcingDto() {
		super();
	}


	public OutsourcingDto(int outno, String title, String content, boolean conclusion, Date regdate, int teamno,
			String teamname, String memberid) {
		super();
		this.outno = outno;
		this.title = title;
		this.content = content;
		this.conclusion = conclusion;
		this.regdate = regdate;
		this.teamno = teamno;
		this.teamname = teamname;
		this.memberid = memberid;
	}


	public int getOutno() {
		return outno;
	}


	public void setOutno(int outno) {
		this.outno = outno;
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


	public boolean isConclusion() {
		return conclusion;
	}


	public void setConclusion(boolean conclusion) {
		this.conclusion = conclusion;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public int getTeamno() {
		return teamno;
	}


	public void setTeamno(int teamno) {
		this.teamno = teamno;
	}


	public String getTeamname() {
		return teamname;
	}


	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}


	public String getMemberid() {
		return memberid;
	}


	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}


	@Override
	public String toString() {
		return "OutsourcingDto [outno=" + outno + ", title=" + title + ", content=" + content + ", conclusion="
				+ conclusion + ", regdate=" + regdate + ", teamno=" + teamno + ", teamname=" + teamname + ", memberid="
				+ memberid + "]";
	}
	
	

	
	
	
}
