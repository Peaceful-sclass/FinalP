package com.wv.root.model.dto;

public class Place_likeDto {
	private int lno;
	private int pno;
	private int memberno;
	private int likecheck;
	public Place_likeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Place_likeDto(int lno, int pno, int memberno, int likecheck) {
		super();
		this.lno = lno;
		this.pno = pno;
		this.memberno = memberno;
		this.likecheck = likecheck;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	} 
	
}
