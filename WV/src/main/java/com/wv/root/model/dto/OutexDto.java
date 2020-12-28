package com.wv.root.model.dto;

import java.util.Date;

public class OutexDto {
	private int outexno;
	private boolean applied;	//신청승인여부. (할일:의뢰테이블의 체결과 외래키로 연결해야한다)
	private String comment;
	private Date regdate;
	private int memberno;
	private String memberid;
	
	
	public OutexDto() {
		super();
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
		return "OutexDto [outexno=" + outexno + ", applied=" + applied + ", comment=" + comment + ", regdate=" + regdate
				+ ", memberno=" + memberno + ", memberid=" + memberid + "]";
	}
	
	
	
	
}