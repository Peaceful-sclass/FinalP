package com.wv.root.model.util;

public class chatajaxres {
	private int chatting_no;
	private String member_id;
	private String content;
	private String regdate;
	private String member_photo;
	public chatajaxres() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	public chatajaxres(int chatting_no, String member_id, String content, String regdate, String member_photo) {
		super();
		this.chatting_no = chatting_no;
		this.member_id = member_id;
		this.content = content;
		this.regdate = regdate;
		this.member_photo = member_photo;
	}

	public int getChatting_no() {
		return chatting_no;
	}
	public void setChatting_no(int chatting_no) {
		this.chatting_no = chatting_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	

}
