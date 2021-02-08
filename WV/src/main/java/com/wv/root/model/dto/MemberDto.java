package com.wv.root.model.dto;

import java.util.Date;

public class MemberDto {
	private int member_no;
    private String member_id;
    private String member_pw;
    private String member_email;
    private String member_grade;
    private Date member_regdate;
    private String member_is;            
    private String member_photo;        
	public MemberDto() {
		super();
	}
	public MemberDto(int member_no, String member_id, String member_pw, String member_email, String member_grade,
			Date regdate, String is, String member_photo) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_email = member_email;
		this.member_grade = member_grade;
		this.member_regdate = regdate;
		this.member_is = is;
		this.member_photo = member_photo;
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
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public Date getRegdate() {
		return member_regdate;
	}
	public void setRegdate(Date regdate) {
		this.member_regdate = regdate;
	}
	public String getIs() {
		return member_is;
	}
	public void setIs(String is) {
		this.member_is = is;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	@Override
	public String toString() {
		return "MemberDto [member_no=" + member_no + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_email=" + member_email + ", member_grade=" + member_grade + ", regdate=" + member_regdate + ", is="
				+ member_is + ", member_photo=" + member_photo + "]";
	}
     
    
}