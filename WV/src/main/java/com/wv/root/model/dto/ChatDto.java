package com.wv.root.model.dto;

import java.util.Date;

public class ChatDto {
	private int chatting_no;
	private String member_id;
	private String content;
	private Date regdate;
	public ChatDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatDto(int chatting_no, String member_id, String content, Date regdate) {
		super();
		this.chatting_no = chatting_no;
		this.member_id = member_id;
		this.content = content;
		this.regdate = regdate;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	

}
