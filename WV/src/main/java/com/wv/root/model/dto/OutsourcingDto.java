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
	
	private String outestContent;	//의뢰성립용1
	private String outestFile;		//의뢰성립용2
	
	
	public OutsourcingDto() {
		super();
	}
	

	public OutsourcingDto(String outestContent, String outestFile) {
		super();
		this.outestContent = outestContent;
		this.outestFile = outestFile;
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
	
	

	public String getOutestContent() {
		return outestContent;
	}



	public void setOutestContent(String outestContent) {
		this.outestContent = outestContent;
	}



	public String getOutestFile() {
		return outestFile;
	}



	public void setOutestFile(String outestFile) {
		this.outestFile = outestFile;
	}



	@Override
	public String toString() {
		return "OutsourcingDto [outno=" + outno + ", title=" + title + ", content=" + content + ", conclusion="
				+ conclusion + ", regdate=" + regdate + ", teamno=" + teamno + ", teamname=" + teamname + ", memberid="
				+ memberid + ", outestContent=" + outestContent + ", outestFile=" + outestFile + "]";
	}
	
	
	
	

	
	
	
}
