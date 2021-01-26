package com.wv.root.model.dto;

public class ChattingDto {
	private int chatting_no;
	private int team_no;
	private String chatting_name;
	public int getChatting_no() {
		return chatting_no;
	}
	public void setChatting_no(int chatting_no) {
		this.chatting_no = chatting_no;
	}
	public int getTeam_no() {
		return team_no;
	}
	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}
	public String getChatting_name() {
		return chatting_name;
	}
	public void setChatting_name(String chatting_name) {
		this.chatting_name = chatting_name;
	}
	public ChattingDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChattingDto(int chatting_no, int team_no, String chatting_name) {
		super();
		this.chatting_no = chatting_no;
		this.team_no = team_no;
		this.chatting_name = chatting_name;
	}
	
	

}
