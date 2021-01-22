package com.wv.root.model.dto;

public class Place_commentDto {
	private int pcno;
	private int pno;
	private String pccontent;
	private String pcwriter;
	private int memberno;
	public Place_commentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Place_commentDto(int pcno, int pno, String pccontent, String pcwriter, int memberno) {
		super();
		this.pcno = pcno;
		this.pno = pno;
		this.pccontent = pccontent;
		this.pcwriter = pcwriter;
		this.memberno = memberno;
	}
	public int getPcno() {
		return pcno;
	}
	public void setPcno(int pcno) {
		this.pcno = pcno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPccontent() {
		return pccontent;
	}
	public void setPccontent(String pccontent) {
		this.pccontent = pccontent;
	}
	public String getPcwriter() {
		return pcwriter;
	}
	public void setPcwriter(String pcwriter) {
		this.pcwriter = pcwriter;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	
}
