package com.wv.root.model.dto;

import java.util.Date;

public class ComuCommentDto {
	private int comucommentno;
	private String comment;
	private Date regdate;
	private int cno;
	private int memberno;
	private String memberid;
	
	
	
	public ComuCommentDto() {
		super();
	}



	public ComuCommentDto(int comucommentno, String comment, Date regdate, int cno, int memberno, String memberid) {
		super();
		this.comucommentno = comucommentno;
		this.comment = comment;
		this.regdate = regdate;
		this.cno = cno;
		this.memberno = memberno;
		this.memberid = memberid;
	}



	public int getComucommentno() {
		return comucommentno;
	}



	public void setComucommentno(int comucommentno) {
		this.comucommentno = comucommentno;
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



	public int getCno() {
		return cno;
	}



	public void setCno(int cno) {
		this.cno = cno;
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
		return "ComuCommentDto [comucommentno=" + comucommentno + ", comment=" + comment + ", regdate=" + regdate
				+ ", cno=" + cno + ", memberno=" + memberno + ", memberid=" + memberid + "]";
	}


	
	
	
	
}