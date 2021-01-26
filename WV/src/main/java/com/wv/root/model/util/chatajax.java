package com.wv.root.model.util;

public class chatajax {
	private int chatting_no;
	private String date;
	public chatajax() {
		super();
		// TODO Auto-generated constructor stub
	}
	public chatajax(int chatting_no, String date) {
		super();
		this.chatting_no = chatting_no;
		this.date = date;
	}
	public int getChatting_no() {
		return chatting_no;
	}
	public void setChatting_no(int chatting_no) {
		this.chatting_no = chatting_no;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	

}
