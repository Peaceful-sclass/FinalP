package com.wv.root.model.dto;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wv.root.model.util.CustomDateSerializer;

public class ComunityDto {
	private int cno;
	private String category;
	private String title;
	private String content;
	private Date regdate;
	private int views;
	private int member_no;
	private String member_id;
	
	
	public ComunityDto() {
		super();
	}


	public ComunityDto(int cno, String category, String title, String content, Date regdate, int views, int member_no,
			String member_id) {
		super();
		this.cno = cno;
		this.category = category;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.views = views;
		this.member_no = member_no;
		this.member_id = member_id;
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

	@JsonSerialize(using = CustomDateSerializer.class)
	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public int getViews() {
		return views;
	}


	public void setViews(int views) {
		this.views = views;
	}


	public int getMember_no() {
		return member_no;
	}


	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	@Override
	public String toString() {
		return "ComunityDto [cno=" + cno + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", views=" + views + ", member_no=" + member_no + ", member_id=" + member_id
				+ "]";
	}




	
	
	
}
