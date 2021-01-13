package com.wv.root.model.dto;

import java.util.Date;

public class OutexDto {
	private int outexno;	//신청번호
	private int outno;		//의뢰번호
	private String title;
	private boolean applied;	//신청승인여부.
	private String comment;
	private Date regdate;
	private int memberno;
	private String memberid;
	
	
	public OutexDto() {
		super();
	}
	
	
	
	public OutexDto(int outexno, int outno, String title, boolean applied, String comment, Date regdate, int memberno,
			String memberid) {
		super();
		this.outexno = outexno;
		this.outno = outno;
		this.title = title;
		this.applied = applied;
		this.comment = comment;
		this.regdate = regdate;
		this.memberno = memberno;
		this.memberid = memberid;
	}



	public OutexDto(int outexno, int outno, boolean applied, String comment, Date regdate, int memberno,
			String memberid) {
		super();
		this.outexno = outexno;
		this.outno = outno;
		this.applied = applied;
		this.comment = comment;
		this.regdate = regdate;
		this.memberno = memberno;
		this.memberid = memberid;
	}



	public OutexDto(int outexno, boolean applied, String comment, Date regdate, int memberno, String memberid) {
		super();
		this.outexno = outexno;
		this.applied = applied;
		this.comment = comment;
		this.regdate = regdate;
		this.memberno = memberno;
		this.memberid = memberid;
	}


	public int getOutexno() {
		return outexno;
	}


	public void setOutexno(int outexno) {
		this.outexno = outexno;
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


	public boolean isApplied() {
		return applied;
	}


	public void setApplied(boolean applied) {
		this.applied = applied;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
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
		return "OutexDto [outexno=" + outexno + ", outno=" + outno + ", title=" + title + ", applied=" + applied
				+ ", comment=" + comment + ", regdate=" + regdate + ", memberno=" + memberno + ", memberid=" + memberid
				+ "]";
	}





	
	
	
	
}
