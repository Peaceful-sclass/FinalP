package com.wv.root.model.dto;

import java.util.Date;

public class CodeDto {
	private int myno;
	private int myco;
	private String myname;
	private String mytitle;
	private String mycoment;
	private String mycontent;
	private Date mydate;
	public CodeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CodeDto(int myno, int myco, String myname, String mytitle, String mycoment, String mycontent, Date mydate) {
		super();
		this.myno = myno;
		this.myco = myco;
		this.myname = myname;
		this.mytitle = mytitle;
		this.mycoment = mycoment;
		this.mycontent = mycontent;
		this.mydate = mydate;
	}
	public int getMyno() {
		return myno;
	}
	public void setMyno(int myno) {
		this.myno = myno;
	}
	public int getMyco() {
		return myco;
	}
	public void setMyco(int myco) {
		this.myco = myco;
	}
	public String getMyname() {
		return myname;
	}
	public void setMyname(String myname) {
		this.myname = myname;
	}
	public String getMytitle() {
		return mytitle;
	}
	public void setMytitle(String mytitle) {
		this.mytitle = mytitle;
	}
	public String getMycoment() {
		return mycoment;
	}
	public void setMycoment(String mycoment) {
		this.mycoment = mycoment;
	}
	public String getMycontent() {
		return mycontent;
	}
	public void setMycontent(String mycontent) {
		this.mycontent = mycontent;
	}
	public Date getMydate() {
		return mydate;
	}
	public void setMydate(Date mydate) {
		this.mydate = mydate;
	}
	
	
}
